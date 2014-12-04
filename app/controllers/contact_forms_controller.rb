class ContactFormsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact_form = ContactForm.new
  end

  def create
    @contact_form = ContactForm.new(contact_form_params)

    if @contact_form.deliver
      flash[:notice] = "Thank you for your message!"
      redirect_to :root
    else
      flash.now[:error] = @contact_form.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def contact_form_params
    params.require(:contact_form).permit(:name, :email, :message)
  end
end
