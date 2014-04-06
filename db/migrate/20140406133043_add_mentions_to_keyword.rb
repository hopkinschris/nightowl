class AddMentionsToKeyword < ActiveRecord::Migration
  def change
    add_column :keywords, :mentions, :text, default: []
  end
end
