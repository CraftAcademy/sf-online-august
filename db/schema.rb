ActiveRecord::Schema.define(version: 20160927163053) do

  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string   "dish_name"
    t.text     "dish_desc"
    t.integer  "dish_price"
    t.text     "dish_allergy"
    t.integer  "dish_cal"
    t.text     "dish_ingredients"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

end
