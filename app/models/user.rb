class User < ActiveRecord::Base

  has_many :datasets, :dependent => :destroy

  attr_accessor :code

  before_save { self.email = email.downcase }
  before_create :create_remember_token
  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates_presence_of :code, :message => "Ask the HoD for a code"
  has_secure_password
  validates :password, length: { minimum: 6 }

  default_scope -> { order('last_name ASC') }

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def self.search(search)
      if search
        where('email LIKE ? OR student_number LIKE ? OR first_name LIKE ? OR last_name LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
      else
        all
      end
  end  

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
