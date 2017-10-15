class CreateCountries < ActiveRecord::Migration[5.1]
  def change
    create_table :countries do |t|
      t.string :country_code
      t.string :country_label

      t.timestamps
    end
  end
end
