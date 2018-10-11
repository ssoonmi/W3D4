# == Schema Information
#
# Table name: answer_choices
#
#  id          :bigint(8)        not null, primary key
#  question_id :integer
#  text        :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswerChoice < ApplicationRecord

  validates :text, presence: true

  has_many :responses,
    foreign_key: :answer_choice_id,
    class_name: 'Response'

  belongs_to :question,
    foreign_key: :question_id,
    class_name: 'Question'

end
