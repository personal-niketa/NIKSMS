class CustomerRegistrationsController < ApplicationController
  layout "dashboard"

  def new
    @customer_registration = CustomerRegistration.new
  end

  def create
    @customer_registration = CustomerRegistration.new(customer_params)
    @customer_registration.save!
    CustomerMailer.welcome_mail(@customer_registration.email).deliver_now!
    flash[:success] = I18n.t('controller.customer_registrations.create.success')
    redirect_to customer_registration_path(id: @customer_registration.id)
  rescue StandardError => e
    ErrorLog.new.write("[CustomerRegistration][CreateError] customer=#{@customer_registration.inspect} error=#{e}")
    flash[:danger] = "Something went wrong."
    redirect_to new_customer_registration_path
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
