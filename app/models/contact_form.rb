class ContactForm < MailForm::Base
  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true

  attribute :nickname, captcha: true
  validates :nickname, length: { is: 0 }, allow_nil: true

  def headers
    {
      subject: "My Contact Form",
      to: "marina@marinamurashev.com",
      from: %("#{name}" <#{email}>)
    }
  end
end
