class SongController < ApplicationController

  get '/songs/new' do
    @genres = Genre.all
    erb :'song/new'
  end

  get '/songs/:slug' do
    @song = Song.find_by_slug(params[:slug])
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
    redirect to "/songs/#{new_song.slug}"
  end
end