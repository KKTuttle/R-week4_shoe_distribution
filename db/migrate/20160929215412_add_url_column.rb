class AddUrlColumn < ActiveRecord::Migration
  def change
    add_column :brands, :logo, :string
  end
end
