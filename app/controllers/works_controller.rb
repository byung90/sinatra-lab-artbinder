class WorksController < ApplicationController

  get '/:slug/:id' do
    @artist = current_user.find_by_slug(params[:slug])
    @work = @artist.works.find_by(id: params[:id])
    erb :'works/show'
  end

  get '/:slug/:id/edit' do
    if logged_in?
      @artist = current_user.find_by_slug(params[:slug])
      @work = @artist.works.find_by(id: params[:id])
      erb :'works/edit'
    else
      redirect to '/'
    end

  end

  post '/:slug/new' do
    if !(params[:title] == "")
      @artist = current_user.find_by_slug(params[:slug])
      @work = @artist.works.create(title: params[:title], medium: params[:medium], year: params[:year].to_i, price: params[:price].to_f)
      @work.save
      redirect to "/#{@artist.name}/#{@work.id}/"
    else
      redirect to "/#{@artist.name}/#{@work.id}/edit"
    end
  end


  patch '/:slug/:id' do
    if !(params[:title] == "")
      @artist = current_user.find_by_slug(params[:slug])
      @work = @artist.works.find_by(id: params[:id])

      @work.title = params[:title]
      @work.medium = params[:medium]
      @work.year = params[:year].to_i
      @work.price = params[:price].to_f

      @work.save

      redirect to "/#{@artist.name}/#{@work.id}"
    else
      redirect to "/#{@artist.name}/#{@work.id}/edit"
    end
  end

  delete '/:slug/:id/delete' do
    if logged_in?
      @artist = current_user.find_by_slug(params[:slug])
      @work = @artist.works.find_by(id: params[:id])

      if @artist.user_id == current_user.id
        @work.delete
        redirect to "/#{@artist.name}"
      else
        redirect to '/'
      end
    else
      redirect to '/'
    end
  end

end
