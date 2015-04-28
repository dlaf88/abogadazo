class Answer < ActiveRecord::Base
  belongs_to :questions
  belongs_to :lawyer
end
