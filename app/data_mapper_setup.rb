require 'data_mapper'
require 'dm-postgres-adapter'

require_relative './models/space'

# require models here

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/vapor_bnb_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
