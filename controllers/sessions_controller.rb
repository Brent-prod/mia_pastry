get '/login' do
    erb :'/sessions/login', locals: { error_message: '' }
end

post '/sessions' do
    email = params[:email]
    password = params[:password]

    user = find_user_by_email( email )

    if BCrypt::Password.new(user['password_digest']) == password
        session[:user_id] = user['id']
        redirect '/display'
    else 
        erb :'/sessions/login', locals: { error_message: 'Incorrect password' }
    end
end

delete '/sessions' do
    session[:user_id] = nil
    redirect '/display'
end

# Sessions Hash -> Keeps information about the user session