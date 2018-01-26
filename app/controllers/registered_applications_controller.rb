class RegisteredApplicationsController < ApplicationController
  def index
    @registered_applications = current_user.registered_applications
  end

  def new
    @registered_application = RegisteredApplication.new
  end

  def create
    @registered_application = current_user.registered_applications.build(registered_application_params)

    if @registered_application.save
      flash[:notice] = "Your application is now registered."
      redirect_to [@registered_application]
    else
      flash.now[:alert] = "There was an error in registering your app. Please try again."
      render :new
    end
  end

  def show
    @registered_application = current_user.registered_applications.find(params[:id])
  end

  def destroy
    @registered_application = current_user.registered_applications.find(params[:id])

    if @registered_application.destroy
      flash[:notice] ="\"#{@registered_application.name}\" was de-registered successfully."
      redirect_to registered_applications_path
    else
      flash.now[:alert] = "There was an error de-registering your app. Please try again."
      render :show
    end
  end

  private
  def registered_application_params
    params.require(:registered_application).permit(:name, :url)
  end

end
