# == Schema Information
#
# Table name: polls
#
#  id         :bigint(8)        not null, primary key
#  author_id  :integer
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Poll < ApplicationRecord
  validates :title, presence: true

  has_many :questions,
    foreign_key: :poll_id,
    class_name: 'Question'

  belongs_to :author,
    foreign_key: :author_id,
    class_name: 'User'


end
