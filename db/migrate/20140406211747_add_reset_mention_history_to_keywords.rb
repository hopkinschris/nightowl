class AddResetMentionHistoryToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :reset_mention_history, :string, default: "daily"
  end
end
