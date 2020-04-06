# greetという名前空間は  挨拶をするタスクを定義
namespace :greet do
  desc "Goodbyeを表示するタスク"
  task say_goodbye: :environment do
    puts "Goodbye"
  end

  desc "Helloを表示するタスク"
  task say_hello: :environment do
    puts "Hello!!"
  end
end

# greet_when_datingという名前空間は  デート時の挨拶をするタスクを定義
namespace :greet_when_dating do
  desc "容姿を褒めるタスク"
  task praise_appearance: :environment do
    puts "You are beautiful!!"
  end

  desc "ファッションを褒めるタスク"
  task praise_fashion: :environment do
    puts "That's fashionable!!"
  end
end