class FixAnnoncementsTable < ActiveRecord::Migration[8.0]
  def change
    remove_column :annoncements, :type, :string
    # REMOVE the `add_reference` line for category here
  end
end
