class Micropost < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :like_users, through: :likes, source: :user
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence:true
  validates :content, presence:true, length: { maximum: 140 }

  def like(user)
    likes.create(user_id: user.id)
  end

  def unlike(user)
    likes.find_by(user_id: user.id).destroy
  end

  def like?(user)
    like_users.include?(user)
  end

  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "5MBまでにしてください")
      end
    end
end
