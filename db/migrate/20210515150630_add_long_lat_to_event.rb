class AddLongLatToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :lat, :decimal
    add_column :events, :long, :decimal
  end
end
