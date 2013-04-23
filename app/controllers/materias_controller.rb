class MateriasController <ApplicationController 


  helper_method :sort_column, :sort_direction
  def index
   if params[:limit] == nil then
   params[:limit] = 2
  end
  @materias = Materia.order(sort_column + " " + sort_direction).search(params[:search]).page(params[:page]).per_page(params[:limit].to_i)
  
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @materias }
    end
  end 

  def show
      @materia = Materia.find(params[:id])
  end

  def new
      @materia  = Materia.new
  end

  def edit
      @materia  = Materia.find(params[:id])
  end

  def create
      @materia  = Materia.new(params[:materia])
      render :action => :new unless @materia.save
  end

  def update
      @materia  = Materia.find(params[:id])
      render :action => :edit unless @horario.update_attributes(params[:materia])
  end

  def destroy
      @materia  = Materia.find(params[:id])
      @materia .destroy
  end

   private
  
  def sort_column
    Instructor.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end

