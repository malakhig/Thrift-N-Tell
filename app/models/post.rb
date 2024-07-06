class Post < ApplicationRecord
  belongs_to :user
  belongs_to :thrift
  has_many_attached :images
  validates :thrift_id, presence: true
  acts_as_votable
  has_many :comments, dependent: :destroy
end
