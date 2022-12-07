class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many :purchases_histories



  validates :nickname, :family_name, :first_name, :family_name_kana, :first_name_kana, :date_of_birth, presence: true

  # validates :family_name, :first_name, :family_name_kana, :first_name_kana, format:{with:/[^\x01-\x7Eｦ-ﾟ]+/,message:"カタカナでご入力下さい。"}

  # validates :password, format:{with: /(/[a-z\d]{6,}/i)}

  # VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/ifreeze
  # validates :password, format: { with: VALID_PASSWORD_REGEX, message: 'は半角英数を両方含む必要があります’}

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  
end
