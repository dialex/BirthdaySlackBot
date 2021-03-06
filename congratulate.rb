APP_ROOT = File.dirname(__FILE__)

$:.unshift(File.join(APP_ROOT, 'lib'))
require 'birthday_bot'
require 'config_reader'

puts '🤖 Bot is booting...'

configs = ConfigReader.new()
if not configs.load('config/configurations.json')
  abort '❌ Bot is shutting down'
end

puts 'Reading configurations'
url = configs.slack_url
channel = configs.channel_name
greeting = configs.greeting_msg
name = configs.bot_name
emoji = configs.bot_emoji

puts '🤖 Bot is running...'
bot = SlackBot.new(url, channel, greeting, name, emoji)
bot.launch!
