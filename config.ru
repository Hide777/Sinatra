require 'rubygems'
require 'bundler'
Bundler.require
#require 'sinatra'
require 'sinatra/reloader' if development?
#require 'sinatra/contrib/all'
#require 'haml'
#require 'csv'
#require 'json'
require 'open-uri'
require 'nokogiri'
require 'robotex'
require './myapp.rb'

run App::Application