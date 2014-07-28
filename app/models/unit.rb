class Unit < ActiveRecord::Base
  belongs_to :user
  has_many :datasets, :dependent => :destroy

  validates :unit_name, :presence => true
  validates :unit_code, :presence => true

end
