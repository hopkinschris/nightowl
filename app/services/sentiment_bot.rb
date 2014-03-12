require 'sentimentalizer'

class SentimentBot
  def initialize(tweet)
    @tweet = tweet
  end

  def analyze
    Sentimentalizer.analyze @tweet
  end
end
