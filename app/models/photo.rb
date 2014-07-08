class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :photo_filename, :presence => true
  validates :category_id, :presence => true

  has_attached_file :photograph, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photograph, :content_type => /\Aimage\/.*\Z/
  validates_attachment :photograph, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png", "image/tiff"] }
    # :styles => { :large => "700x400#", :medium=>"490x368#", :thumbnail=>"75x75#" }

#     :size => { :in => 0..100000.kilobytes },

 # :styles => {
 #    :thumb => ["150x172#",:jpg],
 #    :large => ["100%", :jpg]
 #  }

  def self.search(search)
      if search
        where('photo_filename LIKE ? OR photo_term LIKE ? OR photo_date LIKE ? OR genus_species LIKE ? OR photo_notes LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
  end

end
