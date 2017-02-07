require 'rest-client'
require 'json'
require 'pry'



#request and parse hash
def get_character_movies_from_api
  #all films for all characters
  request = RestClient.get('http://www.swapi.co/api/people/')
  request_parsed = JSON.parse(request)
  all_character_movies_hash = request_parsed["results"]
end



#get the films of the character
def get_film_urls(character, all_character_movies_hash)
  character_hash = all_character_movies_hash.find do |hashes|
    hashes["name"].downcase == character
  end
  if character_hash != nil
    character_hash["films"]
  end
end

# HELPER OF film_titles convert url to title
def movie_title_extract(film_url)

  movie_title = RestClient.get(film_url)
  movie_title = JSON.parse(movie_title)
  movie_title["title"]

end

#get film titles of character
def film_titles(film_urls)
  film_titles = film_urls.map do |film_url|
    movie_title_extract(film_url)
  end

end

#format the films of the character
def format_titles(film_titles)
  list_count = 0
  formatted_films = film_titles.map do |title|
    list_count +=1
    "#{list_count} #{title}"
  end
end

def url_to_formatted(film_urls)
  film_titles= film_titles(film_urls)
  puts format_titles(film_titles)
end





## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
