class Horario < ActiveRecord::Base

  attr_accessible :aula, :dia, :hora, :materia_id, :instructor_id, :curso_id

   def self.search(search)         
               where("aula like '%#{search}%'")
  end

	belongs_to :materia
	belongs_to :curso
	belongs_to :instructor
end
