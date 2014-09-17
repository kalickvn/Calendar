class Notifier < ActionMailer::Base
	default from: "kalickvn2@gmail.com"
  def contact_email(user_info)
    @info = user_info
    mail(:to => "kalickvn2@gmail.com",:subject => "[Contact-Website] ")
  end
end