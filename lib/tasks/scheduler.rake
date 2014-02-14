desc "NightOwl awakens"
task :awaken => :environment do
  puts "Scouring and favouriting..."
  User.active.each do |u|
    bot = Bot.new u
    puts "NightOwl • @#{ u.nickname }"
    bot.scour_twitter
  end
  puts "done."
end
