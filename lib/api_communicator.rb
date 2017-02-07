require 'rest-client'
require 'json'
require 'pry'

global_character_hash = get_character_movies_from_api

global_name_array = global_character_hash["results"].map do |data|
    data["name"].downcase
  end

def get_character_movies_from_api
  #all films for all characters
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
end

def get_film_urls(character, hash, name_arr)
  #use the name array index number to pull the film array from the original hash
  character_name_index = name_arr.index(character_name)
  hash["results"][character_name_index]["films"]
end

def name_existence_test(character_name, hash)  
  hash.include?(character_name)
end

#aurl to title 
def movie_title_extract(url_info)
  movie_title = RestClient.get(url_info)
  movie_title = JSON.parse(movie_title)
  movie_title["title"]
end  

#convert all films to the titles
def parse_character_movies(films_array)
  formatted_films = films_array.map do |film_url|
    movie_title_extract(film_url)
  end

#format list of titles
  formatted_films.each_with_index do |value, index|
    puts (index + 1).to_s + ". " + value
  end
end

# get input and return the list
def runner(character)
  film_array = get_film_urls(character, global_character_hash, global_name_array)
  parse_character_movies(film_array)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
