class AddIndexesToCategoriesAndDetailsAndUsers < ActiveRecord::Migration[7.0]
  def change
    add_index :categories, :author_id, name: "index_categories_on_author_id"
    add_index :details, :category_id, name: "index_details_on_category_id"
    add_index :users, :confirmation_token, unique: true, name: "index_users_on_confirmation_token"
    add_index :users, :email, unique: true, name: "index_users_on_email"
    add_index :users, :reset_password_token, unique: true, name: "index_users_on_reset_password_token"
  end
end
