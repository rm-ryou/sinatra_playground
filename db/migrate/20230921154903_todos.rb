class Todos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string  :name
      t.integer :user_id, null: false

      t.timestamps
    end
  end
end
