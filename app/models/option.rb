class Option < ActiveRecord::Base
  has_many :single_answers
  has_and_belongs_to_many :multiple_answers
  belongs_to :question
  has_one :boolean_answer
  has_one :data_push_mapping
end
