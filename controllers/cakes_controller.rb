get '/cakes' do
  cakes = all_cakes()
  erb :'/cakes/index', locals: { cakes: cakes }
end

# Displays create form
get '/cakes/create' do
  erb :'cakes/new'
end

post '/cakes' do
  cake_name = params[:cake_name]
  price = params[:price]
  image_url = params[:image_url]

  create_cakes(cake_name, image_url, price)

  redirect '/cakes'
end

# Display individual cakes
get '/cakes/:id' do |id|
  # Look up the particular cakes in the database by id
  puts "Id of cakes: " + id

  sql_query = "SELECT * FROM cakes WHERE id = $1;";
  params = [ id ];
  results = run_sql(sql_query, params)
  
  erb :'/cakes/index', locals: { item: results[0]} # Create an individual cakes display ERB 
end

# edit individual cakes
get '/cakes/:id/edit' do |id|
  # Look up the cakes by id, and pass it to the template
  sql_query = "SELECT * FROM cakes WHERE id = $1;"
  params = [ id ]
  results = run_sql(sql_query, params)

  erb :'cakes/edit', locals: { item: results[0]} 
end

# Update individual cakes
put '/cakes/:id' do |id|
  # Get the parameters
  cake_name = params[:name]
  price = params[:price]
  image_url = params[:image_url]

  # Run an UPDATE SQL query
  params = [cake_name, price, image_url, id];
  query = "UPDATE cakes SET cake_name = $1, price = $2, image_url = $3 WHERE id = $4;"
  run_sql( query, params )

  redirect "/cakes/#{id}"
end

# Delete individual cakes
delete '/cakes/:id' do |id|
  # Run a DELETE SQL QUERY
  run_sql("DELETE FROM cakes WHERE id = $1", [id]);
  redirect "/cakes"
end