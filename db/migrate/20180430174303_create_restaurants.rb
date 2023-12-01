class CreateRestaurants < ActiveRecord::Migration[7.0]
  # this method is called when the migration has run. It's the primary method for defining changes to the database schema
  def change
    # begin the definition of a new database table called restaurants
    create_table :restaurants do |t|
      # define two columns in the restaurants table. Both are of type string.
      t.string :name
      t.string :city
      # this line adds two columns, created_at and updated_at, which are automatically managed by ActiveRecord
      t.timestamps
    end
  end
end
