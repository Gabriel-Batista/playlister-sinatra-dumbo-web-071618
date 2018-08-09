class SongController < ApplicationController

  get '/songs/new' do
    @genres = Genre.all
    erb :'song/new'
  end

  get '/songs/:id' do
    'Hello World!'
  end

  post '/songs' do
    new_song = Song.new(params[:name])
    artitst = Artist.find_or_create_by(name: params[:artist])
    genre = Genre.find_or_create_by(id: params[:genre])
    redirect to "/songs/#{new_song.id}"
  end
end
