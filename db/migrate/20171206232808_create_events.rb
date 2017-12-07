class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :host
      t.string :activities
      t.string :address

      t.timestamps
    end
  end
end
