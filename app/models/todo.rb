class Todo < ActiveRecord::Base
  belongs_to :user

  default_scope { order('updated_at DESC') }

  validates :title, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
