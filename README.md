# NightOwl

A Twitter bot who is habitually active or wakeful at night.

It ingests keywords, flies around Twitter searching for those keywords, and swoops down to favourite them on your behalf.

## Features

### Sentiment Analysis

All tweets sentiment analysis before an impression occurs.

By default the system discards tweets with negative sentiment and generates an impression for tweets with positive or neutral sentiment.

### Mindful Mentions

All keywords are mindful of the users who wrote the tweets they were used in, and other users that may have been mentioned in the tweet.

By default the system keeps a history of users whos tweets were favourited and any other users mentioned in them. The system will not favourite another tweet by any of those users within a window of 24 hours (by default).

Mention history for each keyword will be cleared daily.

If you so choose, click the "Advanced" link under each keyword to change that keyword's mention clearing setting from daily to weekly and make sure to hit update.

## Instructions

1. Register your application via the [Twitter Developer portal](https://dev.twitter.com/).

2. Add your consumer key and secret to the `.env` file (create the file in too root of your app): `TWITTER_CONSUMER_KEY=abcde`, `TWITTER_CONSUMER_SECRET=12345678`

3. Create a Heroku app and push the code base up to Heroku. Add a PostgreSQL database add-on and the [Heroku Scheduler](https://addons.heroku.com/scheduler) add-on. You will need to add 3 rake tasks to the scheduler: `rake awaken` which is set to hourly, `rake clear_mentions_daily` which is set to daily, and `rake clear_mentions_weekly` which is set to daily but the code handles only executing it on a weekly basis.

4. Authenticate your Twitter account with the application by logging in for the first time.

5. Take yourself off the waitlist and make yourself an admin: `u=User.where(nickname: 'foobar').first; u.update_attributes! waitlist: "false", roles: [:regular_user, :admin]`

6. Log back into the app and start adding your keywords.

## Prospective Roadmap

- Un-favourite tweets after a certain period of time
- Filter out foreign language tweets
- Don't favourite tweets that are highly likely to not be human (e.g. Buffer, HootSuite)
- Don't favourite tweets of people already following me (option provided to the user)
- Fix: `undefined method '+' for nil:NilClass`
- Add conversion analytics
- Wrap up into a [FluidApp](http://fluidapp.com/developer/)

## Authors

Christopher Hopkins

- [http://twitter.com/hopkinschris](http://twitter.com/hopkinschris)
- [http://github.com/hopkinschris](http://github.com/hopkinschris)

## License

You may use NightOwl under the terms of the [MIT License](https://github.com/hopkinschris/nightowl/blob/master/LICENSE).
