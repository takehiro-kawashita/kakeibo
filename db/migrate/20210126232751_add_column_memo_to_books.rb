class AddColumnMemoToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :memo, :string
  end
end
