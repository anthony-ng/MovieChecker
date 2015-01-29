get '/' do
  popular_movie1 = Omdb::Api.new.fetch('The Hunger Games')
  @popular_movie1 = popular_movie1[:movie]

  popular_movie2 = Omdb::Api.new.fetch('The Dark Knight')
  @popular_movie2 = popular_movie2[:movie]

  popular_movie3 = Omdb::Api.new.fetch('The Avengers')
  @popular_movie3 = popular_movie3[:movie]

  popular_movie4 = Omdb::Api.new.fetch('The Interview')
  @popular_movie4 = popular_movie4[:movie]

  erb :index
end

get '/movie' do

  all_movies = Omdb::Api.new.search(params[:movie])
  movies_info = all_movies[:movies]
  p movies_info.length
  p movies_info
  p "----------------------THIS IS A LINE-------------------"

  if movies_info.length > 0
    @movie_list = []
    movies_info.each do |movie|
      the_movie = Omdb::Api.new.fetch(movie.title)
      @movie_list << the_movie[:movie]
    end
    p @movie_list.length
    p @movie_list[0]
    p "################"
    p @movie_list[1]
  else
    puts "Non Existing movie name"
  end

  erb :list
end

get '/about' do
  erb :about
end

get '/popular' do
  popular_movie1 = Omdb::Api.new.fetch('AMERICAN SNIPER')
  @popular_movie1 = popular_movie1[:movie]

  popular_movie2 = Omdb::Api.new.fetch('THE BOY NEXT DOOR')
  @popular_movie2 = popular_movie2[:movie]

  popular_movie3 = Omdb::Api.new.fetch('PADDINGTON')
  @popular_movie3 = popular_movie3[:movie]

  popular_movie4 = Omdb::Api.new.fetch('THE HOBBIT: THE BATTLE OF THE FIVE ARMIES')
  @popular_movie4 = popular_movie4[:movie]

  popular_movie5 = Omdb::Api.new.fetch('TAKEN 3')
  @popular_movie5 = popular_movie4[:movie]

  popular_movie6 = Omdb::Api.new.fetch('THE IMITATION GAME')
  @popular_movie6 = popular_movie4[:movie]

  popular_movie7 = Omdb::Api.new.fetch('STRANGE MAGIC')
  @popular_movie7 = popular_movie4[:movie]

  popular_movie8 = Omdb::Api.new.fetch('SELMA')
  @popular_movie8 = popular_movie4[:movie]

  erb :popular
end

get '/comingsoon' do
  erb :coming
end

get '/theater' do
  erb :theater
end
