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

product = Product.find(2)
puts y(product)
