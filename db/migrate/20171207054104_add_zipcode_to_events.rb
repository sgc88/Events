class AddZipcodeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :zipcode, :integer
  end
end
