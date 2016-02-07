class AddTickerTextAndTickerToDesign < ActiveRecord::Migration
  def change
    add_column :designs, :ticker_text, :text
    add_column :designs, :ticker, :boolean
  end
end
