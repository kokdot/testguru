class CreateBagesRules < ActiveRecord::Migration[5.2]
  def change
    create_table :bages_rules do |t|
      t.string :title
      t.references :bage, foreign_key: true
      t.references :condition, foreign_key: true

      t.timestamps
    end
  end
end
