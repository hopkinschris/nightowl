class AddRolesToUser < ActiveRecord::Migration
  def change
    add_column :users, :roles, :text, default: [:regular_user]
  end
end
