require "active_record"

ActiveRecord::Base.establish_connection(
  adapter:  'sqlite3',
  database: ':memory:'
)

ActiveRecord::Migration.create_table :products do |t|
  t.string :name
  t.timestamps
end

class Product < ActiveRecord::Base
  def to_s
    'Tasty Cakes'
  end
end

