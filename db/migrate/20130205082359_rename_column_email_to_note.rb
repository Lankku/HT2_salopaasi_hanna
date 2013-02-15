class RenameColumnEmailToNote < ActiveRecord::Migration
  def change
    rename_column :users, :email, :note
  end

end
