# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer
#  answer_choice_id :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :respondent_cannot_answer_a_second_time
  validate :author_of_poll_cannot_respond_to_own_poll

  belongs_to :respondent,
    foreign_key: :user_id,
    class_name: 'User'

  belongs_to :answer_choice,
    foreign_key: :answer_choice_id,
    class_name: 'AnswerChoice'

  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :poll,
    through: :question,
    source: :poll

  def sibling_responses
    self.question.responses.where.not(id: self.id)
  end

  def respondent_already_answered?
    sibling_responses.exists?(user_id: self.user_id)
  end

  def respondent_cannot_answer_a_second_time
    if respondent_already_answered?
      errors[:user_id] << 'user cannot answer question again'
    end
  end

  def author_answering?
    self.poll.author_id == self.user_id
  end

  def author_of_poll_cannot_respond_to_own_poll
    if author_answering?
      errors[:user_id] << 'author of poll cannot answer own poll'
    end
  end

end
