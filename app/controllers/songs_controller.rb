class SongController < ApplicationController

  get '/songs/new' do
    erb :'song/new'
  end

end
