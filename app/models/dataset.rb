class Dataset < ActiveRecord::Base
  belongs_to :user
  belongs_to :unit

  has_many :headers, :dependent => :destroy
  accepts_nested_attributes_for :headers, :reject_if => :all_blank, :allow_destroy => true
  
  validates :project_name, :presence => true

end
