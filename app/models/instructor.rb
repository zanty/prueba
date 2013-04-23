class Instructor < ActiveRecord::Base
  attr_accessible :cedula, :direccion, :email, :fch_nacimiento, :materia_id, :nombres, :telefono

    def self.search(search)         
               where("cedula like '%#{search}%' or direccion like '%#{search}%' or email like '%#{search}%' or nombres like '%#{search}%' or telefono like '%#{search}%'")
  end
has_many :horarios
belongs_to :materia
 
end
 