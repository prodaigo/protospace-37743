class Prototype < ApplicationRecord
  # before_action :authenticate_user!, only: [:new, :edit, :destroy]

  belongs_to :user
  has_many :comments, dependent: :destroy  #dependentで親要素と子要素を道連れに
  has_one_attached :image  #has_one_attached:各レコードとファイルを1対1の関係で紐付けるメソッド。

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :concept, presence:true
  validates :image, presence: true
end
