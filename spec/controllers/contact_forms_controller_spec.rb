require 'rails_helper'

describe ContactFormsController do

  describe "POST#create" do
    let(:contact_form) { build :contact_form }

    it "redirects to root if delivery is successful" do
      allow_any_instance_of(ContactForm).to receive(:deliver).and_return(true)
      request = post :create, contact_form: { name: contact_form.name, email: contact_form.email }
      expect(request).to redirect_to :root
    end

    it "renders the 'new' view if delivery fails" do
      allow_any_instance_of(ContactForm).to receive(:deliver).and_return(false)
      request = post :create, contact_form: { name: contact_form.name, email: contact_form.email }
      expect(request).to render_template :new
    end
  end
end
