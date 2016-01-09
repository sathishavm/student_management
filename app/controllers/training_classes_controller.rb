class TrainingClassesController < ApplicationController
  before_action :set_training_class, only: [:show, :edit, :update, :destroy, :register]

  # GET /training_classes
  # GET /training_classes.json
  def index
    @training_classes = TrainingClass.all
    @current_user_classes = current_user.training_classes if current_user
  end

  # GET /training_classes/1
  # GET /training_classes/1.json
  def show
  end

  # GET /training_classes/new
  def new
    @training_class = TrainingClass.new
  end

  # GET /training_classes/1/edit
  def edit
  end

  # POST /training_classes
  # POST /training_classes.json
  def create
    @training_class = TrainingClass.new(training_class_params)

    respond_to do |format|
      if @training_class.save
        format.html { redirect_to @training_class, notice: 'Class was successfully created.' }
        format.json { render :show, status: :created, location: @training_class }
      else
        format.html { render :new }
        format.json { render json: @training_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /training_classes/1
  # PATCH/PUT /training_classes/1.json
  def update
    respond_to do |format|
      if @training_class.update(training_class_params)
        format.html { redirect_to @training_class, notice: 'Class was successfully updated.' }
        format.json { render :show, status: :ok, location: @training_class }
      else
        format.html { render :edit }
        format.json { render json: @training_class.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /training_classes/1
  # DELETE /training_classes/1.json
  def destroy
    @training_class.destroy
    respond_to do |format|
      format.html { redirect_to training_classes_url, notice: 'Class was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def register
    current_user.training_classes << @training_class
    redirect_to training_classes_path, notice: 'Registered for the Class successfully.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_training_class
      @training_class = TrainingClass.find(params[:id] || params[:training_class_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def training_class_params
      params.require(:training_class).permit(:name)
    end
end
