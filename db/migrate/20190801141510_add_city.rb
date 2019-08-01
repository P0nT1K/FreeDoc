class AddCity < ActiveRecord::Migration[5.2]
  def change
    add_reference :doctors, :city, foreign_key: true
    add_reference :patients, :city, foreign_key: true
    add_reference :appointments, :city, foreign_key: true
  end
end
#On a conçu une 2 relation 1-N entre tables dont la "foreign_key" est placée sur city.
   #Car chaque ville contient plusieurs promeneurs et plusieurs chiens
   #mais un chien et un promeneur ne peuvent appartenir qu'a une ville.