class RemoveNullFromShorty < ActiveRecord::Migration[5.1]
  def change
    remove_column :shorties, :shortened, :string
  end
end
