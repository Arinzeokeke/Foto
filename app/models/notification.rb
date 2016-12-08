class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :op_user, class_name: "User"
  belongs_to :post

  validates :user_id, :op_user_id, :post_id, :notification_type, presence: true
end
