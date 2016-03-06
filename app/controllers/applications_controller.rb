class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @application = Application.new
  end

  def destroy
    @application = Application.find(params[:id])

    if @application.destroy
      flash[:notice] = "\"#{@application.title}\" was deleted successfully."
      redirect_to applications_path
    else
      flash.now[:alert] = "There was an error deleting the application"
      render :show
    end
  end

  def index
    @applications = Application.all
  end


  def show
    @application = Application.find(params[:id])
    @events = @application.events.group_by(&:name)
  end

  def create
    @application = Application.new
    @application.title = params[:application][:title]
    @application.url = params[:application][:url]
    @application.user_id = current_user.id

    if @application.save

      flash[:notice] = "Application was saved."
      redirect_to @application
    else
      flash.now[:alert] = "There was an error saving the application"
      render :new
    end
  end
end
