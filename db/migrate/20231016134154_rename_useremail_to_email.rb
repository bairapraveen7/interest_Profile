class RenameUseremailToEmail < ActiveRecord::Migration[7.0]
  def change
    rename_column :users, :useremail, :email
  end
end
