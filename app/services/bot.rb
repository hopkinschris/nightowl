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
        @client.search(k.name, result_type: "recent", count: 10).take(10).each do |tweet|
          if @client.favorite(tweet)
            k.impression_count += 1
            k.save
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

  def establish_client
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = @user.token
      config.access_token_secret = @user.secret
    end
  end
end
