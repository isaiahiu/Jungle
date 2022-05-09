class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 3 }
  validates :name, presence: true
  validates :last_name, presence: true

  def authenticate_with_credentials(email, password)
    user = User.find_by_email(email)
    if user.authenticate(password) == true 
      user     
    else
      nil
   end
  end

end
