class AddRateToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :rate, :integer, :default => 5
  end
end
