class CreateBagesUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bages_users do |t|
      t.references :test, foreign_key: true
      t.references :user, foreign_key: true
      t.references :bages_rule, foreign_key: true

      t.timestamps
    end
  end
end
