require 'dotenv/load'
require 'discordrb'

bot_token = ENV['BOT_TOKEN']
bot_name = ENV['BOT_NAME']
channel_id = ENV['CHANNEL_ID']

bot = Discordrb::Bot.new(token: bot_token)

bot.ready {
  bot.send_message(channel_id, "#{bot_name} is up!")
}

bot.message {|e|
  unless e.author.bot_account?
    if e.content.include?(bot.profile.mention)
      m = `ipfs stats bw`.to_s.sub("Bandwidth\n", "").gsub("\n", " ").chomp
      e.respond(m)
    end
  end
}

bot.run
