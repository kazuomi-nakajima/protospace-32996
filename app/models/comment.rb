class Comment < ApplicationRecord
  #テーブル関係
  belongs_to :user
  belongs_to :prototype

  #データが空の場合NG
  validates :text, presence: true
end
