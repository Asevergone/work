class AddCForarticleComment < ActiveRecord::Migration[5.0]
  def change
  	add_column :articles, :comments_num,:integer
  end
end
