class Bot
  MAX_ATTEMPTS = 3

  def initialize(user)
    if @user = user
      establish_client
    end
  end

  def scour_twitter
    num_attempts = 0
    begin
      num_attempts += 1
      @user.keywords.each do |k|
        @client.search(k.name, result_type: k.result_type, count: 10).take(k.rate).each do |tweet|
          begin
            if sentiment_analysis(k, tweet) && mention_extraction(k, tweet)
              if @client.favorite(tweet)
                k.impression_count += 1
                k.save
              end
            end
          rescue => e
            puts "#{ e.message }"
          end
        end
      end
    rescue Twitter::Error::TooManyRequests => error
      if num_attempts <= MAX_ATTEMPTS
        sleep (error.rate_limit.reset_in.nil? ? 15.minutes : error.rate_limit.reset_in)
        puts "Waiting..."
        retry
      else
        raise
      end
    end
  end

  private

  def mention_extraction(keyword, tweet)
    mention_extractor = MentionExtractor.new keyword, tweet
    mention_extractor.perform
    mention_extractor.instance_variable_get(:@forward)
  end

  def sentiment_analysis(keyword, tweet)
    sentiment = SentimentBot.new tweet.text
    results = sentiment.analyze
    if results.include?(':)')
      # POSITIVE
      if keyword.sentiment.include?('positive')
        return true
      else
        return false
      end
    elsif results.include?(':|')
      # NEUTRAL
      if keyword.sentiment.include?('neutral')
        return true
      else
        return false
      end
    else
      # NEGATIVE
      if keyword.sentiment.include?('negative')
        return true
      else
        return false
      end
    end
  end

  def establish_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = @user.token
      config.access_token_secret = @user.secret
    end
  end
end
