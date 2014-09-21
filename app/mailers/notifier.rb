class Notifier < ActionMailer::Base
	default from: "kalickvn2@gmail.com"
  def contact_email(contact_info)
    @info = contact_info
    mail(:to => "kalickvn2gmail.com",:from =>"kalickvn2@gmail.com",:subject => "[Contact-Website] " + @info["subject"])
  end
  
  def send_order(order_info)
    @info = order_info
    mail(:to => "kalickvn2@gmail.com",:from => "kalickvn2@gmail.com",:subject => "[Order-Website] New order ")
  end
end