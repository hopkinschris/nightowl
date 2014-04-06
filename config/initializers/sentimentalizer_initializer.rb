require 'sentimentalizer'

NightOwl::Application.configure do
  config.after_initialize do
    Sentimentalizer.setup if Rails.env.production?
  end
end
