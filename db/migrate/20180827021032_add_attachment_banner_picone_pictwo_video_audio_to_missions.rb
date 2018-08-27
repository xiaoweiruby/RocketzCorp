class AddAttachmentBannerPiconePictwoVideoAudioToMissions < ActiveRecord::Migration[5.1]
  def self.up
    change_table :missions do |t|
      t.attachment :banner
      t.attachment :picone
      t.attachment :pictwo
      t.attachment :video
      t.attachment :audio
    end
  end

  def self.down
    remove_attachment :missions, :banner
    remove_attachment :missions, :picone
    remove_attachment :missions, :pictwo
    remove_attachment :missions, :video
    remove_attachment :missions, :audio
  end
end
