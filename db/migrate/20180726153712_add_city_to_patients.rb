class AddCityToPatients < ActiveRecord::Migration[5.2]
  def change
    add_reference :patients, :city
  end
end
