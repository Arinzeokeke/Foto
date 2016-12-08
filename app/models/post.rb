class Post < ApplicationRecord
	belongs_to :user
	has_many :comments, dependent: :destroy
	validates :user_id, presence: true
	validates :avatar, presence: true
	validates_length_of :caption, {:maximum => 300, :minimum => 3}
	has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

    scope :of_followed_users, -> (following_users) { where user_id: following_users}


    acts_as_votable
    has_many :notifications, dependent: :destroy
end
