class CreateInstruments < ActiveRecord::Migration[7.0]
  def change
    create_table :instruments do |t|
      t.string :ticker
      t.float :amount
      t.float :avarage_cost

      t.timestamps
    end
  end
end
