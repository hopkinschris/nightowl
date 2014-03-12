class AddSentimentToKeywords < ActiveRecord::Migration
  def change
    add_column :keywords, :sentiment, :text, default: [:positive, :neutral]
  end
end
