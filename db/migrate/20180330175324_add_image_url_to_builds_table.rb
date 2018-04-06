class AddImageUrlToBuildsTable < ActiveRecord::Migration[5.1]
  def change
    add_column :builds, :image_url, :string
  end
end
