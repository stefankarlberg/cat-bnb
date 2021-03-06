class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  
  def create_profile(params={})
    if self.profile.nil?
      super
    else
      errors.add(:base, "Profile already exists")
    end
  end
end
