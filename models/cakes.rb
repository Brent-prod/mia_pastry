def all_cakes()
  run_sql("SELECT * FROM cakes;")
end

def create_cakes(cake_name, image_url, price)
  sql_query = "INSERT INTO cakes(cake_name,image_url,price) VALUES($1, $2, $3);";
  params = [cake_name, image_url, price]
  run_sql(sql_query, params)
end