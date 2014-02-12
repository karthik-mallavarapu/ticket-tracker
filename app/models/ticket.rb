class Ticket < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, length: {minimum: 10}
  validates :priority, presence: true

end
