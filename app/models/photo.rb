class Photo < ActiveRecord::Base
  belongs_to :user
  validates :photo_filename, :presence => true

  has_attached_file :photograph, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :photograph, :content_type => /\Aimage\/.*\Z/
  validates_attachment :photograph, :presence => true,
    :content_type => { :content_type => ["image/jpeg", "image/gif", "image/png"] },
    :size => { :in => 0..10000.kilobytes }

  def self.search(search)
      if search
        where('photo_category LIKE ? OR photo_filename LIKE ? OR photo_term LIKE ? OR photo_date LIKE ? OR genus_species LIKE ? OR photo_notes LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
  end

end
