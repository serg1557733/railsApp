class Comment < ApplicationRecord
  include Visible

  belongs_to :post
  validates :commenter, presence: true
  validates :body, presence: true, length: {minimum: 10}

end
