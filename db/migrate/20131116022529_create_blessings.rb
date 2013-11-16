class CreateBlessings < ActiveRecord::Migration
  def change
    create_table :blessings do |t|
      t.string :editor, null: false
      t.text :content, null: false

      t.timestamps
    end
  end
end
