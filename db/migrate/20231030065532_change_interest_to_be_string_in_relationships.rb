class ChangeInterestToBeStringInRelationships < ActiveRecord::Migration[7.0]
  def change
    change_column :relationships, :interest, :string
  end
end
