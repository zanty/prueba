class Materia < ActiveRecord::Base
  attr_accessible :nombres

    def self.search(search)         
               where("nombres like '%#{search}%'")  
  end

	has_many :horarios
	has_many :instructores
end 
