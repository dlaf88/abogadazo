class Question < ActiveRecord::Base
  has_many :answers 
  validates_presence_of :description, {message: "Por favor es necesario una descripción de la pregunta."}
  validates_presence_of :phone, {message: "Por favor necesitamos un email para poder informarte que tu pregunta ha sido contestada."}
  validates_acceptance_of :terms, message: "Es necesario acordar con los terminos de servicio para hacer una pregunta.", allow_nil: false
end
