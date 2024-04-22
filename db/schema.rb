# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_04_21_193439) do
  create_table "answer_choices", force: :cascade do |t|
    t.text "content"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "created_at"], name: "index_answer_choices_on_question_id_and_created_at"
    t.index ["question_id"], name: "index_answer_choices_on_question_id"
  end

  create_table "answers", force: :cascade do |t|
    t.text "content"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "chart_values", force: :cascade do |t|
    t.string "label"
    t.integer "height"
    t.integer "question_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id", "created_at"], name: "index_chart_values_on_question_id_and_created_at"
    t.index ["question_id"], name: "index_chart_values_on_question_id"
  end

  create_table "question_assignments", force: :cascade do |t|
    t.integer "question_id", null: false
    t.integer "skill_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_question_assignments_on_question_id"
    t.index ["skill_id"], name: "index_question_assignments_on_skill_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "content"
    t.text "correct_answer"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "question_type", default: "multiple_choice"
    t.text "graph_content", default: "Placeholder Title"
  end

  create_table "skills", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_skills", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "skill_id", null: false
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["skill_id"], name: "index_user_skills_on_skill_id"
    t.index ["user_id"], name: "index_user_skills_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "remember_digest"
    t.integer "admin", default: 1
    t.string "activation_digest"
    t.boolean "activated", default: false
    t.datetime "activated_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answer_choices", "questions"
  add_foreign_key "answers", "questions"
  add_foreign_key "chart_values", "questions"
  add_foreign_key "question_assignments", "questions"
  add_foreign_key "question_assignments", "skills"
  add_foreign_key "user_skills", "skills"
  add_foreign_key "user_skills", "users"
end
