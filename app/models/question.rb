class Question < ActiveRecord::Base
  has_many :answers 
  validates_presence_of :description, {message: "Por favor es necesario una descripción de la pregunta."}
  validates_presence_of :phone,email: true
  validates_format_of :phone, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,:message => "No email"
  #validates_acceptance_of :terms, message: "Es necesario acordar con los terminos de servicio para hacer una pregunta.", allow_nil: false
end
