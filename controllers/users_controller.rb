get '/signup' do
  erb :'users/signup'
end

post '/users' do
  email = params[:email] 
  password = params[:password]
  # these two are receiving info from signup.erb

  create_user(email, password) 
  # it creates a new user

  user = find_user_by_email( email )
  # finding an user by email to get the "id"

  session[:user_id] = user['id']
  # assinging the current user id to the session id 

  redirect '/cakes'
end