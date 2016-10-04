class AddAttachmentImageToMoulds < ActiveRecord::Migration
  def self.up
    change_table :moulds do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :moulds, :image
  end
end
