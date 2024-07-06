class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_rich_text :body
  acts_as_votable
  has_many :notification_mentions, as: :record, dependent: :destroy, class_name: "Noticed::Event"
end
