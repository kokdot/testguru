class CreateBageUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bage_users do |t|
      t.references :bage, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
