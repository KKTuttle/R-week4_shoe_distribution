class AddImageColumn < ActiveRecord::Migration
  def change
    add_column :stores, :image, :string
  end
end
