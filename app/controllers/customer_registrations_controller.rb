class CustomerRegistrationsController < ApplicationController
  layout "dashboard"

  def new
    @customer_registration = CustomerRegistration.new
  end

  def create
    @customer_registration = CustomerRegistration.new(customer_params)
    if @customer_registration.save!
      flash[:success] = "#{@customer_registration.email} registered successfully."
    else
      flash[:danger] = "Something went wrong."  
    end
    redirect_to customer_registration_path(id: @customer_registration.id)
  end

  def show
    @customer_registration = CustomerRegistration.find_by(id: params[:id])
  end

  private

  def customer_params
    params.require(:customer_registration).permit(:first_name, :last_name, :email, :hobby, 
      :source_of_hearing, :country)
  end

end
