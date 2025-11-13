class AddCategoryToTasks < ActiveRecord::Migration[7.0]
  def change
    # Cambiar null: false por null: true para permitir valores nulos
    add_reference :tasks, :category, null: true, foreign_key: true
  end
end
