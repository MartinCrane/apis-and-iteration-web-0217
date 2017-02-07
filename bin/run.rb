#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user

while !name_existence_test(character)
	puts "Name not included!!! Enter another: "
	character = get_character_from_user
end

runner(character)
# film_urls = get_film_urls(character)
# while film_urls == nil
# 	puts "character doesnt exist"
# 	character = get_character_from_user
# 	characters_exist = get_film_urls(character)
# end

