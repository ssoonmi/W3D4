# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  poll_id    :integer
#  text       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  validates :text, presence: true

  has_many :answer_choices,
    foreign_key: :question_id,
    class_name: 'AnswerChoice'

  belongs_to :poll,
    foreign_key: :poll_id,
    class_name: 'Poll'

  has_many :responses,
    through: :answer_choices,
    source: :responses

  def n_1_results
    p all_answers = self.answer_choices.includes(:responses)
    results_hash = Hash.new(0)
    all_answers.each do |answer_choice|
      answer_choice.responses.each do |response|
        results_hash[answer_choice.text] += 1
      end
    end
    results_hash
  end

end
