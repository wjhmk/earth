class AddPrefectureToPost < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :prefecture, :string
  end
end
