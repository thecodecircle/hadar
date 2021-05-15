class AddStreetToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :street, :string
  end
end
