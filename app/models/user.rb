class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, allow_blank: false
  validates :email, presence: true, allow_blank: false
  validates :password, presence: true, allow_blank: false
  has_many :expenses, dependent: :destroy, foreign_key: :author_id
  has_many :categories, dependent: :destroy, foreign_key: :author_id
end
