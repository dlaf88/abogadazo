class CreateFirms < ActiveRecord::Migration[5.0]
  def change
    create_table :firms do |t|
      t.text :description
      t.string :name
      t.string :logo
      t.string :address
      t.string :state
      t.string :office_phone
      t.string :website

      t.timestamps
    end
  end
end
