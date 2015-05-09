class Question < ActiveRecord::Base
  has_many :answers 
  validates_presence_of :description, {message: "Por favor es necesario una descripción de la pregunta."}
  validates_presence_of :phone, {message: "Por favor necesitamos un telefono o email para poder informarte que tu pregunta ha sido contestada.
"}
  
end
