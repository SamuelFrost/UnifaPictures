class PicturesUserForeignKey < ActiveRecord::Migration[6.1]
  def change
    change_table :pictures do |table|
      table.belongs_to :user, foreign_key: true
    end
  end
end
