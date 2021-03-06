require './dependencies.rb'

db = URI.parse(ENV['DATABASE_URL'] || 'mysql2://root:@localhost/unicorn_testing')

ActiveRecord::Base.establish_connection(
  :adapter  => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
  :host     => db.host,
  :port     => db.port,
  :username => db.user,
  :password => db.password,
  :database => db.path[1..-1],
  :encoding => 'utf8'
)

class Product < ActiveRecord::Base
end

get '/' do
  "hello world!"
end

get '/products/:id' do
  begin
    product = Product.find(params[:id])
    "Hello #{product.name}"
  rescue
    "Not Found"
  end
end

not_found do
  'nop'
end

error do
  'boooommm! ' + env['sinatra.error'].name
end
