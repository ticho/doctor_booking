class AddCityToDoctors < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :city
  end
end
