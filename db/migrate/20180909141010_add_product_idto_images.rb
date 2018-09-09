class AddProductIdtoImages < ActiveRecord::Migration[5.2]
  def change
    add_column :images, :product_id, :integer
    add_column :images, :alt, :string
  end
end
