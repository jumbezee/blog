class Article < ActiveRecord::Base
  validates :title, presence: true, length: { in: 1..90 }
  validates :text, presence: true, length: { in: 10..10000 }
  belongs_to :user
  has_many :comments

  def subject
    title
  end

  def last_comment
    comments.last
  end
end
