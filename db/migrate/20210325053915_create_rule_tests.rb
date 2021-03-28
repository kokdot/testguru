class CreateRuleTests < ActiveRecord::Migration[5.2]
  def change
    create_table :rule_tests do |t|
      t.references :test_passage, foreign_key: true
      t.references :bages_rule, foreign_key: true

      t.timestamps
    end
  end
end
