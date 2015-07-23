#encoding: utf-8
require 'rubygems'
require 'bundler'
Bundler.require
#require 'sinatra'
#require 'sinatra/reloader' if development?
#require 'sinatra/contrib/all'
#require 'haml'
#require 'csv'
#require 'json'
#require 'open-uri'
#require 'nokogiri'
#require 'robotex'

module App
  class Application < Sinatra::Base 
    class Comment < ActiveRecord::Base
    end
    before do
      @edition = "20150723 Edition"
    end
    configure :development do
      register Sinatra::Reloader
    end
    configure do
      register Sinatra::ActiveRecordExtension
      set :database, {adapter: "sqlite3", database: "./db/development.db"}
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
      @message = "erb examples"
      @comments = Comment.order('id desc')
      erb :index, locals: {foo: @message}
    end
    post '/comment' do
      Comment.create({
        body: params[:body],
        user_id: params[:user_id]
      })
    end
    get '/test' do
      @message = "Bootstrap3 "
      erb :test
    end
    get '/haml' do
      @message = "haml examples"
      haml :'haml/index', :layout => :'haml/layout'
    end
    get '/haml/table' do
      @users = Gauge.all
      haml :'haml/table', :layout => :'haml/layout'
    end
    get '/haml/test' do
      @message = "MSN"
      url = 'http://www.msn.co.jp/'
      # user_agentの偽装
      user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
      charset = nil
      html = open(url, "User-Agent" => user_agent) do |f|
        charset = f.charset # 文字種別を取得
        f.read
      end
      @doc = Nokogiri::HTML.parse(html, nil, charset)
      haml :'haml/test', :layout => :'haml/layout'
    end
    get '/haml/test1' do
      @message = "Local File" 
      file = File.open("source.html")
      @doc = Nokogiri::HTML.parse(open(file))
      haml :'haml/test', :layout => :'haml/layout'
    end
    get '/haml/sc' do
      @message = "Yahoo"
      url = 'http://news.yahoo.co.jp/hl?c=bus'
      # user_agentの偽装
      user_agent = 'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1500.63 Safari/537.36'
      charset = nil
      html = open(url, "User-Agent" => user_agent) do |f|
        charset = f.charset # 文字種別を取得
        f.read
      end
      @doc = Nokogiri::HTML.parse(html, nil, charset)
      haml :'haml/sc', :layout => :'haml/layout'
    end
    get '/graph' do
      @message = "Hello Graph Page"
      content_type :json
      data = file_convert
      data.to_json
    end
  end
end