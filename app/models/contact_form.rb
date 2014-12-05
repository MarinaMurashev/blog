class ContactForm < MailForm::Base
  MAIL_TO_ADDRESS = "marina@marinamurashev.com"

  attribute :name, validate: true
  attribute :email, validate: /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message, validate: true

  attribute :nickname, captcha: true
  validates :nickname, length: { is: 0 }, allow_nil: true

  def headers
    {
      subject: "My Contact Form",
      to: MAIL_TO_ADDRESS,
      from: %("#{name}" <#{email}>)
    }
  end
end
