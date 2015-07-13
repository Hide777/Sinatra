#encoding: utf-8
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

module App
  class Application < Sinatra::Base  
    before do
      @edition = "20150713Ed"
    end
    configure :development do
      register Sinatra::Reloader
    end
    configure do
      register Sinatra::ActiveRecordExtension
      set :database, {adapter: "sqlite3", database: "./db/development.sqlite3"}
    end
   
    class Gauge < ActiveRecord::Base
    end  
   
    def file_convert
      datatime=""
      CSV.foreach("./temp.csv","r") do |data|
         datatime = data
      end
      return datatime
    end
        
    # routing
    get '/' do
      @message = "Bootstrap3 "
      erb :index, locals: {foo: @message}
    end
    get '/test' do
      @message = "Bootstrap3 "
      erb :test
    end
    get '/haml' do
      @message = "Sample App Haml"
      haml :index, locals: {foo: @message}
    end
    get '/haml/table' do
      @users = Gauge.all
      haml :'sample/table'
    end
    get '/haml/test' do
      @message = "Test Routing"
      haml :'sample/test'
    end
    get '/haml/sc' do
      @message = "スクレイピング"
      url = 'http://www.yahoo.co.jp/'
      # user_agentの偽装
      user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
      charset = nil
      html = open(url, "User-Agent" => user_agent) do |f|
        charset = f.charset # 文字種別を取得
        f.read
      end
      @doc = Nokogiri::HTML.parse(html, nil, charset)
      haml :'sample/sc'
    end
    get '/graph' do
      @message = "Hello Graph Page"
      content_type :json
      data = file_convert
      data.to_json
    end
  end
end
