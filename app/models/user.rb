class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items

  # --- バリデーション ---
  validates :name, presence: true
  validates :birthday, presence: true

  # パスワードは半角英数字混合であること
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: PASSWORD_REGEX }

  with_options presence: true do
    validates :family_name
    validates :first_name
    validates :family_name_kana
    validates :first_name_kana
  end

  with_options format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ }, allow_blank: true do
    validates :family_name
    validates :first_name
  end

  with_options format: { with: /\A[ァ-ヶー]+\z/ }, allow_blank: true do
    validates :family_name_kana
    validates :first_name_kana
  end
end
