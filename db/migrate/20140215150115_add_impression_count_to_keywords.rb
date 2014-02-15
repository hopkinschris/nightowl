class AddImpressionCountToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :impression_count, :integer, :default => 0
  end
end
