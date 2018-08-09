class GenresController < ApplicationController
    get '/genres' do
        @genres = Genre.all
        erb :'genre/index'
    end

    # get '/genres/new' do
    #     @genres = Genre.all
    #     erb :'genre/new'
    # end

    get '/genres/:slug' do
        @genre = Genre.find_by_slug(params[:slug])
        @artists = @genre.artists
        @songs = @genre.songs
        erb :'genre/show'
    end

    # post '/genres' do
    #     new_genre = Genre.new(name: params[:name])
    #     artist = Artist.find_or_create_by(name: params[:artist])
    #     song = Genre.find_or_create_by(id: params[:genre])

    #     new_genre.artist = artist
    #     new_genre.genres << genre

    #     new_genre.save
    #     redirect to "/genres/#{new_genre.slug}"
    # end
end