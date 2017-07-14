require('rspec')
require('pg')
require('stylist')
require('actor')

DB = PG.connect(dbname: 'stylist_database_test')

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM stylists *;')
    #  DB.exec("DELETE FROM actors *;")
  end
end
