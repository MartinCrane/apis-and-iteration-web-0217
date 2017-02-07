#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
all_character_movies_hash = get_character_movies_from_api
film_urls = get_film_urls(character,all_character_movies_hash)


while !!film_urls == false
	puts "This is character is not in Star Wars"
	character = get_character_from_user
	film_urls = get_film_urls(character,all_character_movies_hash)
end

url_to_formatted(film_urls)
