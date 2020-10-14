class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    
  with_options presence: true do
   NAME_VALIDATES = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
   NAMEkana_VALIDATES = /\A[ァ-ヶー－]+\z/.freeze
   validates :nickname
   validates :birthday
   validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}+\z/, message: 'Password Include both letters and numbers.'}
   validates :first_name, format: { with: NAME_VALIDATES, message: 'First name Full-width characters.'}
   validates :last_name, format: { with:  NAME_VALIDATES, message: 'Last name Full-width characters.'}
   validates :first_name_kana, format: { with: NAMEkana_VALIDATES, message: 'First name kana full-width katakana characters.'}
   validates :last_name_kana, format: { with: NAMEkana_VALIDATES, message: 'Last name kana last-width katakana characters.'}
  #  validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  end

end
