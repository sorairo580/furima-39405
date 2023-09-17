class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true
  validates :password, format: { with: /\A(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]+\z/ }, length: { minimum: 6 }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/u }
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/u }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/u }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー]+\z/u }
  validates :birthday, presence: true
end
