get '/cakes' do
  results = all_cakes()
  erb :'/cakes/index', locals: { menu: results }
end

# Displays create form
get '/cakes/create' do
  erb :'cakes/new'
end

post '/cakes' do
  name = params[:name]
  price = params[:price]
  image_url = params[:image_url]

  create_cakes(name, price, image_url)

  redirect '/display'
end

# Display individual cakes
get '/cakes/:id' do |id|
  # Look up the particular cakes in the database by id
  puts "Id of cakes: " + id

  sql_query = "SELECT * FROM cakes WHERE id = $1;";
  params = [ id ];
  results = run_sql(sql_query, params)


  erb :'/cakes/display', locals: { item: results[0]} # Create an individual cakes display ERB 
end

# Display individual cakes
get '/cakes/:id/edit' do |id|
  # Look up the cakes by id, and pass it to the template
  sql_query = "SELECT * FROM cakes WHERE id = $1;"
  params = [ id ]
  results = run_sql(sql_query, params)


  erb :'cakes/edit', locals: { item: results[0]} # Need to create this template
end

# Update individual cakes
put '/cakes/:id' do |id|
  # Get the parameters
  name = params[:name]
  price = params[:price]
  image_url = params[:image_url]

  # Run an UPDATE SQL query
  params = [name, price, image_url, id];
  query = "UPDATE cakes SET name = $1, price = $2, image_url = $3 WHERE id = $4;"
  run_sql( query, params )

  redirect "/cakes/#{id}"
end

# Delete individual cakes
delete '/cakes/:id' do |id|
  # Run a DELETE SQL QUERY
  run_sql("DELETE FROM cakes WHERE id = $1", [id]);
  redirect "/cakes"
end