class AddColumnToMicroposts < ActiveRecord::Migration[5.1]
  def change
    add_column :microposts, :micropost_id, :integer
  end
end
