class WelcomeController < ApplicationController

  def index

  end

  def bot
    bot = TelegramBot.new(token: '184132015:AAF0FGn2Rp71YU04_X78pg1lTv7HMoWMrz0')
    bot.get_updates(fail_silently: true) do |message|
      puts "@#{message.from.username}: #{message.text}"
      command = message.get_command_for(bot)

      message.reply do |reply|
        case command
          when /greet/i
            reply.text = "Hello, #{message.from.first_name}!"
          else
            reply.text = "#{message.from.first_name}, have no idea what #{command.inspect} means."
        end
        puts "sending #{reply.text.inspect} to @#{message.from.username}"
        reply.send_with(bot)
      end
    end
  end
end
