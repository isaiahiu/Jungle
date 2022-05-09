class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 3 }
  validates :name, presence: true
  validates :last_name, presence: true

  def self.authenticate_with_credentials(email, password)
    filtered_email = email.strip.downcase
    user = User.find_by_email(filtered_email)
    if user && user.authenticate(password)
      user     
    else
      nil
   end
  end

end


