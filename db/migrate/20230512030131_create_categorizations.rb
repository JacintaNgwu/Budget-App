class CreateCategorizations < ActiveRecord::Migration[7.0]
  def change
    create_table :categorizations do |t|
      t.bigint "category_id"
    t.bigint "detail_id"

      t.timestamps
    end
  end
end
