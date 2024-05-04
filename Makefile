bot:
	ruby bot.rb

id:
	ipfs id | jq .ID | ruby -e 'puts gets.strip[-5..-2]'
