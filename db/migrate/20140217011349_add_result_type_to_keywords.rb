class AddResultTypeToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :result_type, :string, :default => "mixed"
  end
end
