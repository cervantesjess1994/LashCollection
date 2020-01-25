class SessionsController < ApplicationController

    get '/login' do 
        erb :"sessions/login"
    end

    post '/login' do
      #login user w/ this email
        login(params[:email], params[:password])
        redirect '/lashes'
    end

    get '/logout' do
        logout!
        redirect '/'
    end
end