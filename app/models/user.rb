class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :rememberable, :trackable, :omniauthable, omniauth_providers: [:facebook]
  has_many :time_slot

  VALID_EMAIL_REGEX = %r(\A[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*\Z)
  validates :email, format: { with: VALID_EMAIL_REGEX }
end
