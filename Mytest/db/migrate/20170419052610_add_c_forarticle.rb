class AddCForarticle < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :user_name,:string
  	add_column :articles, :read_count,:integer
  end
end
