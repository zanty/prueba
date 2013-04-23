class Curso < ActiveRecord::Base
  attr_accessible :ficha, :nombre
  has_many :estudiantes
  def self.search(search)         
               where("ficha like '%#{search}%' or nombre like '%#{search}%'")
  end

  has_many :horarios
end
