# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 1) do

# Could not dump table "DATA" because of following StandardError
#   Unknown type '' for column 'CL'

# Could not dump table "MASTER" because of following StandardError
#   Unknown type '' for column 'Name'

  create_table "STANDARD", :primary_key => "Name", :force => true do |t|
    t.integer "No"
    t.text    "Spec1",     :null => false
    t.text    "Spec2",     :null => false
    t.text    "Standard1"
    t.text    "Standard2"
    t.text    "Standard3"
    t.text    "Standard4"
    t.text    "Standard5"
    t.text    "Standard6"
    t.text    "Standard7"
    t.text    "Ref1"
    t.text    "Ref2"
    t.text    "Ref3"
    t.text    "Ref4"
    t.text    "Ref5"
    t.text    "Ref6"
    t.text    "Ref7"
    t.text    "DateStart"
    t.text    "DateVali"
  end

  add_index "STANDARD", ["Name", "Spec1", "Spec2", "DateStart"], :name => "sqlite_autoindex_STANDARD_1", :unique => true

# Could not dump table "VENDOR" because of following StandardError
#   Unknown type '' for column 'VendorCode'

  create_table "posts", :force => true do |t|
    t.string   "username"
    t.string   "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
