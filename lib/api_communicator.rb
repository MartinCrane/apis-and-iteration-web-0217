require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  films = []
  character_hash["results"].each do |character_info|
    if character_info["name"] == character
      films = character_info["films"]
      break
    else

    end
    
  end
  films
end

def movie_title_extract(url_info)
  movie_title = RestClient.get(url_info)
  movie_title = JSON.parse(movie_title)
  movie_title["title"]
end  

def parse_character_movies(films_array)
  formatted_films = films_array.map do |film_url|
    movie_title_extract(film_url)
  end

  formatted_films.each_with_index do |value, index|
    puts (index + 1).to_s + ". " + value
  end
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end


## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?

# movie_title_extract("http://swapi.co/api/films/7/")