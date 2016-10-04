class Contact < ActiveRecord::Base
include MailForm::Delivery

  # append :remote_ip, :user_agent, :session
  # attributes :name, :email, :created_at
  attribute :name,      :validate => true
  attribute :email,     :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :message
  # attribute :nickname,  :captcha  => true

  def headers
    {
      :subject => "My Contact Form",
      :to => "mnjthapliyal@gmail.com",
      :from => %("#{name}" <#{email}>)
    }
  end
end
