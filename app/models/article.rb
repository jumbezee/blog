class Article < ActiveRecord::Base
  validates :title, presence: true, length: { in: 1..20 }
  validates :text, presence: true, length: { in: 10..1000 }

  has_many :comments

  def subject
    title
  end

  def last_comment
    comments.last
  end
end
