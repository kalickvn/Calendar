# This controller is used to register new user
# History: June 06, 2013
# By NamTV

class RegistrationsController < Devise::RegistrationsController
  ##
  #Override new of Devise::RegistrationsController
  #Parameters::
  #Return::
  # * page of register user include organization
  #*Author*:: PhuNd
  def new
    @organizations = Organization.get_all_orgs
    super
  end

  ##
  #Override create of Devise::RegistrationsController
  #Parameters::
  #Return::
  # * page of register if error and login if not error
  #*Author*:: NamTV
  def create
    if verify_recaptcha
      @organizations = Organization.get_all_orgs
      super
    else
      build_resource
      clean_up_passwords(resource)
      flash.now[:error] = t("errors.messages.wrong_captcha")
      flash.delete :recaptcha_error
      @organizations = Organization.get_all_orgs
      render :new
    end
  end
end