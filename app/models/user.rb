class User < ActiveRecord::Base
  has_many :orders
  has_secure_password

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: {minimum: 5}

  def self.authenticate_with_credentials(email, password)
    newEmail = email.strip.downcase

    @user = User.find_by(email: newEmail)
    if @user
      @user 
    else
      nil
    end
  end
end