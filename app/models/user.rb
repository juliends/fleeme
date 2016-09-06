class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable
         # Commenter validatable rend la création d' users sans mot de passe possible
         #:validatable
        
  has_many :unsubs, dependent: :destroy
end
