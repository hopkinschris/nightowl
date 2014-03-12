desc "NightOwl awakens"
task :awaken => :environment do
  puts "Scouring and favouriting..."
  User.active.each do |u|
    puts "NightOwl • @#{ u.nickname }"
    bot = Bot.new u
    bot.scour_twitter
    puts "Complete"
  end
  puts "done."
end
