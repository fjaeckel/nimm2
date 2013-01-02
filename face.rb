#!/usr/bin/env ruby
#
# (c) 2013 Frederic Jaeckel
#

require_relative 'lib/models.rb'

require 'rubygems'
require 'sinatra'


category1 = Category.create(:name => "comedy")
category2 = Category.create(:name => "monitoring")
Site.create(:title => "nom nom nom", :url => "http://www.nimm2.de/", :category => category1)
Site.create(:title => "graphite", :url => "http://graphite.wikidot.com/", :category => category2)

get '/' do
  sites = Site.all
  categories = Category.all
  puts sites
  erb :index,
      :locals => {
        :categories => categories,
        :sites => sites
      }
end

# post all new links here
post '/add' do
end
