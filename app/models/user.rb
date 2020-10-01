class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  
  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :password, format: { with: /\A[a-zA-Z0-9]+\z/,message: "Password Include both letters and numbers."}
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+/,message: "First name Full-width characters."}
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+/,message: "Last name Full-width characters."}
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "First name kana full-width katakana characters."}
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: "Last name kana last-width katakana characters."}
  end
end
 