class SongController < ApplicationController

  get '/songs/new' do
    @genres = Genre.all
    erb :'song/new'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    @genres = @song.genres
    erb :'song/show'
  end

  post '/songs' do
    new_song = Song.new(name: params[:name])
    artist = Artist.find_or_create_by(name: params[:artist])
    genre = Genre.find_or_create_by(id: params[:genre])

    new_song.artist = artist
    new_song.genres << genre

    new_song.save
    redirect to "/songs/#{new_song.id}"
  end
end