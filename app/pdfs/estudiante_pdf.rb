class EstudiantePdf < Prawn::Document
	def initialize(estudiante, view)
  super()
  @estudiante = estudiante
  @view = view
  foto = "#{@estudiante.foto.path(:small)}"
  image foto, :position => :center
  text "Estudiante Nro: #{@estudiante.id}"
  text "Nombre: #{@estudiante.nombres}"
end
end
