class CreateShorties < ActiveRecord::Migration[5.1]
  def change
    create_table :shorties do |t|
      t.string :original, :null => false
      t.string :shortened, :null => false
      t.integer :use_count, default: 0

      t.timestamps
    end
  end
end
