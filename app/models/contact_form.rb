class ContactForm < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  attribute :nickname, captcha: true

  def headers
    {
      subject: "My Contact Form",
      to: "marina@marinamurashev.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
