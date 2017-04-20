class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :comments
      t.string :user_name
      t.text :body
      t.string :article_title

      t.timestamps
    end
  end
end
