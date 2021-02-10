class RemoveColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :tests, :category_id
    remove_column :questions, :test_id
    remove_column :answers, :question_id
  end
end
