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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150607092850) do

	create_table "activities", force: :cascade do |t|
		t.datetime "from"
		t.datetime "to"
		t.integer "activity_type_id"
		t.integer "organizer_id"
		t.integer "participant_count"
		t.float "required_level"
		t.string "location_name"
		t.float "lat"
		t.float "lng"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "activity_types", force: :cascade do |t|
		t.string "name"
		t.text "style"
		t.string "image_url"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "comments", force: :cascade do |t|
		t.string "text"
		t.integer "writer"
		t.integer "activity_id"
		t.datetime "created_at", null: false
		t.datetime "updated_at", null: false
	end

	create_table "directs", force: :cascade do |t|
		t.integer "user_id"
		t.integer "direct_id"
		t.datetime "created_at", null: false
		t.datetime "updated_at", null: false
	end

	add_index "directs", ["user_id", "direct_id"], name: "index_directs_on_user_id_and_direct_id", unique: true

	create_table "profiles", force: :cascade do |t|
		t.string "name"
		t.text "description"
		t.string "picture"
		t.date "born"
		t.boolean "male"
		t.datetime "registered", default: '2015-07-07 15:56:17'
		t.float "rating_mean"
		t.integer "rating_count", default: 0
		t.integer "user_id"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "rpush_apps", force: :cascade do |t|
		t.string "name", null: false
		t.string "environment"
		t.text "certificate"
		t.string "password"
		t.integer "connections", default: 1, null: false
		t.datetime "created_at"
		t.datetime "updated_at"
		t.string "type", null: false
		t.string "auth_key"
		t.string "client_id"
		t.string "client_secret"
		t.string "access_token"
		t.datetime "access_token_expiration"
	end

	create_table "rpush_feedback", force: :cascade do |t|
		t.string "device_token", limit: 64, null: false
		t.datetime "failed_at", null: false
		t.datetime "created_at"
		t.datetime "updated_at"
		t.integer "app_id"
	end

	add_index "rpush_feedback", ["device_token"], name: "index_rpush_feedback_on_device_token"

	create_table "rpush_notifications", force: :cascade do |t|
		t.integer "badge"
		t.string "device_token", limit: 64
		t.string "sound", default: "default"
		t.string "alert"
		t.text "data"
		t.integer "expiry", default: 86400
		t.boolean "delivered", default: false, null: false
		t.datetime "delivered_at"
		t.boolean "failed", default: false, null: false
		t.datetime "failed_at"
		t.integer "error_code"
		t.text "error_description"
		t.datetime "deliver_after"
		t.datetime "created_at"
		t.datetime "updated_at"
		t.boolean "alert_is_json", default: false
		t.string "type", null: false
		t.string "collapse_key"
		t.boolean "delay_while_idle", default: false, null: false
		t.text "registration_ids"
		t.integer "app_id", null: false
		t.integer "retries", default: 0
		t.string "uri"
		t.datetime "fail_after"
		t.boolean "processing", default: false, null: false
		t.integer "priority"
		t.text "url_args"
		t.string "category"
	end

	add_index "rpush_notifications", ["app_id", "delivered", "failed", "deliver_after"], name: "index_rapns_notifications_multi"
	add_index "rpush_notifications", ["delivered", "failed"], name: "index_rpush_notifications_multi", where: "NOT delivered AND NOT failed"

	create_table "settings", force: :cascade do |t|
		t.string "var", null: false
		t.text "value"
		t.integer "thing_id"
		t.string "thing_type", limit: 30
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	add_index "settings", ["thing_type", "thing_id", "var"], name: "index_settings_on_thing_type_and_thing_id_and_var", unique: true

	create_table "suggestions", force: :cascade do |t|
		t.integer "activity_id", null: false
		t.integer "user_id", null: false
		t.integer "status", null: false
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	create_table "users", force: :cascade do |t|
		t.string "email", default: "", null: false
		t.string "encrypted_password", default: "", null: false
		t.integer "role", default: 0
		t.string "provider"
		t.string "uid"
		t.string "reset_password_token"
		t.datetime "reset_password_sent_at"
		t.datetime "remember_created_at"
		t.integer "sign_in_count", default: 0, null: false
		t.datetime "current_sign_in_at"
		t.datetime "last_sign_in_at"
		t.string "current_sign_in_ip"
		t.string "last_sign_in_ip"
		t.string "authentication_token"
		t.integer "notification_system"
		t.string "notification_id"
		t.datetime "created_at"
		t.datetime "updated_at"
	end

	add_index "users", ["authentication_token"], name: "index_users_on_authentication_token", unique: true
	add_index "users", ["email"], name: "index_users_on_email", unique: true
	add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
