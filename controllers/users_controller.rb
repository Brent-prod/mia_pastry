get '/signup' do
  erb :'users/signup'
end

post '/users' do
  email = params[:email]
  password = params[:password]

  create_user(email, password)

  redirect '/display'
end