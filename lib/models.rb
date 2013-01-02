#!/usr/bin/env ruby
#
# (c) 2013 Frederic Jaeckel
#

require 'data_mapper'
require 'dm-types'
require 'dm-timestamps'

dbname = ENV['db_name']
dbhost = ENV['db_host']
dbuser = ENV['db_user']
dbpass = ENV['db_password']

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "mysql://#{dbuser}:#{dbpass}@#{dbhost}/#{dbname}")

class Category
  include DataMapper::Resource

  property :id,       Serial, :key => true
  property :name,     String, :required => true, :length => 64

  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date

  has n, :sites
end

class Site
  include DataMapper::Resource

  property :id,       Serial, :key => true
  property :title,    String, :required => true, :length => 32
  property :url,      String, :required => true, :length => 1024
  
  property :created_at, DateTime
  property :created_on, Date
  property :updated_at, DateTime
  property :updated_on, Date

  belongs_to :category
end


DataMapper.finalize
DataMapper.auto_upgrade!
DataMapper.auto_migrate!
