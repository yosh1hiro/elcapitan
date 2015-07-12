class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 , maximum: 12}
  has_secure_password

  before_create :create_auto_login_token

  class << self
    def generate_auto_login_token
      SecureRandom.hex
    end

    def digest(token)
      Digest::SHA1.hexdigest(token.to_s)
    end

  end

  private
  def create_auto_login_token
    self.auto_login_token = User.digest(User.generate_auto_login_token) 
  end
end
