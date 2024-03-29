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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_210_203_210_556) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'cards', force: :cascade do |t|
    t.string   'front'
    t.string   'back'
    t.integer  'deck_id'
    t.datetime 'created_at',             null: false
    t.datetime 'updated_at',             null: false
    t.string   'image'
    t.integer  'status', default: 0
    t.index ['deck_id'], name: 'index_cards_on_deck_id', using: :btree
  end

  create_table 'decks', force: :cascade do |t|
    t.string   'title'
    t.string   'description'
    t.integer  'user_id'
    t.datetime 'created_at',  null: false
    t.datetime 'updated_at',  null: false
    t.boolean  'public'
    t.index ['user_id'], name: 'index_decks_on_user_id', using: :btree
  end

  create_table 'users', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at',                          null: false
    t.datetime 'updated_at',                          null: false
    t.index ['email'], name: 'index_users_on_email', unique: true, using: :btree
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true, using: :btree
  end

  add_foreign_key 'cards', 'decks'
  add_foreign_key 'decks', 'users'
end
