class LashPostsController < ApplicationController

    get '/lashes' do
        @lashes = LashPost.all.reverse
        erb :'lashes/index'
    end


    get '/lashes/new' do
        #check if logged in
        if !logged_in?
            redirect '/login' #redirecting if they arent logged in
        else
            erb :'lashes/new' #render new form if they are logged in
        end
    end

    post '/lashes' do
        @lashes = LashPost.new(params)
            if !@lashes.name.empty? && !@lashes.brand.empty?
                @lashes.user = current_user
                @lashes.save
                erb :'/lashes/show'
            else
                @error= "Missing name/brand field. Please try again."
                redirect '/lashes/new'
            end
        end
    get '/lashes/:id' do
            @lashes = LashPost.find(params[:id])
            erb :'lashes/show'
        end

    get '/lashes/:id/edit' do
            #checking if logged in
        if !logged_in?
            redirect "/login" #redirecting if arent
        else #current user can only edit their own posts
            #if it can find post that belongs to current user by id then redirect to that post
            if @lashes = current_user.lash_posts.find_by(params[:id])
            erb :'/lashes/edit'
            else
                #if not then redirect to their index/their homepage
                redirect '/lashes'
            end
        end
    end
    
    patch '/lashes/:id' do
        @lashes = LashPost.find(params[:id])
            if !params["lashes"]["name"].empty? && !params["lashes"]["brand"].empty?
                @lashes.update(params["lashes"])
                redirect "/lashes/#{@lashes.id}"
            else 
                @error = "Missing name or brand field. Please try again"
                redirect "/lashes/#{@lashes.id}/edit"
            end
    end

    delete '/lashes/:id' do
        lashes = LashPost.find(params[:id])
        lashes.destroy
        redirect '/lashes'
    end

end