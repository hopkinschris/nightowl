desc "NightOwl awakens"
task :awaken => :environment do
  puts "Scouring and favouriting..."
  User.active.each do |u|
    bot = Bot.new u
    puts "NightOwl • @#{ u.nickname }"
    bot.scour_twitter
    puts "Complete"
  end
  puts "done."
end
