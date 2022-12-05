class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases_histories



  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :date_of_birth, presence: true

  # validates :family_name, :first_name, :family_name_kana, :first_name_kana, format:{with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"カタカナでご入力下さい。"}



end
