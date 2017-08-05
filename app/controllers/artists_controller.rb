class ArtistsController < ApplicationController

  get '/artist' do
    redirect to '/'
  end

  get '/artist/new' do
    erb :'artists/add'
  end

  post '/artist' do
    if !(params[:name] == "")
      @artist = current_user.artists.create(name: params[:name])
      redirect to '/'
    else
      redirect to '/artist/new'
    end

  end

  get '/:slug' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/show'
  end

  get '/:slug/edit' do
    @artist = Artist.find_by_slug(params[:slug])
    erb :'artists/edit'
  end

  patch '/:slug' do
    if params[:name] == ""
      redirect to "/#{@artist.slug}/edit"
    else
      @artist = current_user.artists.find_by(params[:id])
      @artist.name = params[:name]
      @artist.save
      redirect to "/#{@artist.name}"
    end
  end


end
