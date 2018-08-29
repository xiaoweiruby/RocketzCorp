class Mission < ApplicationRecord
# picone validation
has_attached_file :picone, styles: {large: "1500x500>", medium: "500x400>", thumb: "200x150#" }
validates_attachment_content_type :picone, content_type: /\Aimage\/.*\z/
end
#for searching
def self.search(params)
  #mission =Mission.where("title LINK ? or subtitle LINK ? or boxtitle LINK ？ or boxinfo LINK ？"),
  #{}"%#{params[:search]}%","%#{params[:search]}%","%#{params[:search]}%",
#  "%#{params[:search]}%", ) if params[:search].present?
  #missions
end
