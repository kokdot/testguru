class CreateBages < ActiveRecord::Migration[5.2]
  def change
    create_table :bages do |t|
      t.string :url_picture
      t.string :title
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
