#!/usr/bin/env ruby
#
# (c) 2013 Frederic Jaeckel
#

require_relative 'lib/models.rb'

require 'rubygems'
require 'sinatra'

get '/' do
  sites = Site.all
  categories = Category.all
  erb :index,
      :locals => {
        :categories => categories,
        :sites => sites
      }
end

get '/category' do
  if params[:name]
    Category.create(:name => params[:name])
  end
  erb :category
end

# post all new links here
post '/add' do
  if params[:title] && params[:url] && params[:category]
    Site.create(:title => params[:title],
                :url => params[:url],
                :category => Category.first(:id => params[:category]))
  end
  redirect "/", 303
end
