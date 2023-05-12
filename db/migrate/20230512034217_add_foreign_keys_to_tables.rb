class AddForeignKeysToTables < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key "categories", "users", column: "author_id"
    add_foreign_key "categorizations", "categories"
    add_foreign_key "categorizations", "details"
    add_foreign_key "details", "categories"
  end
end
