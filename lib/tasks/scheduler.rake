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
  puts "Clearing mention history for daily keywords"
  Keyword.daily.find_each do |k|
    k.update_attributes! mentions: []
  end
end

desc "On a weekly basis reset the mention history for Keywords deemed `weekly`"
task :clear_mentions_weekly => :environment do
  if Time.now.sunday?
    puts "Clearing mention history for weekly keywords"
    Keyword.weekly.find_each do |k|
      k.update_attributes! mentions: []
    end
  end
end
