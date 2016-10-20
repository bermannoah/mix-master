class UpdateForeignKey < ActiveRecord::Migration
  def change
    remove_foreign_key :songs, :artists
    
    add_foreign_key :songs, :artists, on_delete: :cascade
  end
end
