class ArtistsController < ApplicationController
    get '/artists' do
        @artists = Artist.all
        erb :'artist/index'
    end

    get '/artists/new' do
        @genres = Genre.all
        erb :'artist/new'
    end

    get '/artists/:slug' do
        @artist = Artist.find_by_slug(params[:slug])
        @songs = @artist.songs
        @genres = @artist.genres
        erb :'artist/show'
    end

    post '/artists' do
        new_artist = Genre.new(name: params[:name])
        params[:songs].each do |song|
            songs << Song.find_or_create_by(name: song)
        end
        params[:genres].each do |song|
            songs << Genre.find_or_create_by(id: genre)
        end
        # genre = Genre.find_or_create_by(id: params[:genre])

        new_artist.songs << songs
        new_artist.genres << genres

        new_artist.save
        redirect to "/artists/#{new_artist.slug}"
    end
end
