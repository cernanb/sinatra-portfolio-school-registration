require 'rack-flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    use Rack::Flash
    set :session_secret, "never_trust_the_ide"
  end

  get '/' do
    if logged_in?
      @user = current_user

      erb :'index'
    else
      erb :'index_logged_out'
    end
  end

  post '/' do
    @user = Student.find_by(:email => params[:email])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect "/"
    else
      redirect to '/signup'
    end
  end

  get '/logout' do
    if !!session[:user_id]
      session.destroy
    end
      redirect to '/'
  end

  get '/signup' do
    if logged_in?
      redirect to '/'
    else
      erb :'/users/sign_up'
    end
  end

  post '/signup' do
    if params.any? { |k, v| v.length <=2 }
      redirect to '/signup'
    else
      @user = Student.new(:name => params[:name], :email => params[:email], :password => params[:password])
      @user.save
      session[:user_id] = @user.id
      redirect to '/'
    end
  end

  helpers do
     def logged_in?
       !!session[:user_id]
     end

     def is_admin?
       session[:user_id] == admin_id
     end

     def admin_id
       9
     end

     def current_user
         @user = Student.find(session[:user_id])
     end
   end
end
