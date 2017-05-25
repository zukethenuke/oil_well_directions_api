class CreateNdWells < ActiveRecord::Migration[5.1]
  def change
    create_table :nd_wells do |t|
      t.bigint :api_no
      t.integer :file_no
      t.string :current_operator
      t.string :current_well_name
      t.string :lease_name
      t.string :lease_number
      t.string :original_operator
      t.string :original_well_name
      t.date :spud_date
      t.integer :td
      t.string :county_name
      t.string :township
      t.string :range
      t.integer :section
      t.string :qq
      t.string :footages
      t.string :field_name
      t.string :produced_pools
      t.string :oil_water_gas_cums
      t.string :ipt_date_oil_water_gas
      t.string :wellbore
      t.float :latitude
      t.float :longitude
      t.string :well_type
      t.string :well_status
      t.string :ctb
      t.date :well_status_date

      t.timestamps
    end
  end
end
