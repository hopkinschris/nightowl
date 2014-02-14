class ChangeUserWaitlistDefault < ActiveRecord::Migration
  def change
    change_column :users, :waitlist, :string, :default => "true"
  end
end
