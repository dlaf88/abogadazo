class AlertEmailJob < ActiveJob::Base
  queue_as :default

  def perform(question_id)
    question = Question.find(question_id)
    QuestionNotifier.inform_mail(question).deliver
  end
end
