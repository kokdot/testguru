class CreateGists < ActiveRecord::Migration[5.2]
  def change
    create_table :gists do |t|
      t.string :question
      t.string :url
      t.string :email

      t.timestamps
    end
  end
end
