desc "NightOwl awakens"
task :awaken => :environment do
  puts "Scouring and favouriting..."
  User.active.find_each do |u|
    puts "NightOwl • @#{ u.nickname }"
    bot = Bot.new u
    bot.scour_twitter
    puts "Complete"
  end
  puts "done."
end

desc "On a daily basis reset the mention history for Keywords deemed `daily`"
task :clear_mentions_daily => :environment do
  Keyword.daily.find_each do |k|
    k.mentions = []
    k.save
  end
end

desc "On a weekly basis reset the mention history for Keywords deemed `weekly`"
task :clear_mentions_weekly => :environment do
  if Time.now.sunday?
    Keyword.weekly.find_each do |k|
      k.mentions = []
      k.save
    end
  end
end
