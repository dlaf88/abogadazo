class QuestionNotifier < ApplicationMailer
  default :from => 'diego@abogadazo.com'

  def inform_mail(question)
    @question = question
    mail(
      :to => 'dlaf88@gmail.com',
      :subject => 'Someone just made a question on Abogadazo'
      )
  end 
end
