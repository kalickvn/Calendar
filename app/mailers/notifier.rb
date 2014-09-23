class Notifier < ActionMailer::Base
	default from: "kalickvn2@gmail.com"
  def contact_email(contact_info)
    @info = contact_info
    admin =Setting.where(:code => Setting::CODE_ATTR[:EMAIL_FEED].to_s).first
    if admin.blank?
      value = "kalickvn5@gmail.com"
    else
      value = admin.value
    end
    mail(:to => value,:from =>"kalickvn2@gmail.com",:subject => "[Contact-Website] " + @info["subject"])
  end
  
  def send_order(order_info)
    @info = order_info
    admin =Setting.where(:code => Setting::CODE_ATTR[:EMAIL_FEED].to_s).first
    if admin.blank?
      value = "kalickvn5@gmail.com"
    else
      value = admin.value
    end

    mail(:to => value,:from => "kalickvn2@gmail.com",:subject => "[Order-Website] New order ")
  end
end