class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.date :remaining
      t.boolean :complte

      t.timestamps
    end
  end
end
