class CreateTasks < ActiveRecord::Migration[8.1]
    def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.datetime :due_date
      t.integer :status, default: 0
      t.integer :priority, default: 1
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

