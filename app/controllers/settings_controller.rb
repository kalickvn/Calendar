# coding: UTF-8
class SettingsController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"
  require 'fileutils'
  def edit
    @text_setting = Setting.where(:code => Setting::CODE_ATTR[:PROMOTE_NEWS].to_s).first
    @email_setting = Setting.where(:code => Setting::CODE_ATTR[:EMAIL_FEED].to_s).first
    @home_page = Setting.where(:code => Setting::CODE_ATTR[:HOME_INTRO].to_s).first
    @intro_page = Setting.where(:code => Setting::CODE_ATTR[:INTRO_FIELD].to_s).first
    @pricing_page = Setting.where(:code => Setting::CODE_ATTR[:PRICING_FIELD].to_s).first
  end

  def index
  end

  def update
    setting = params["setting"]
    if setting
      if setting[:promotion]
        @edit_setting = Setting.where(:code => Setting::CODE_ATTR[:PROMOTE_NEWS].to_s).first
        if @edit_setting
          @edit_setting.update_attributes(:value => setting[:promotion])
        else
          @edit_setting = Setting.create(:code =>Setting::CODE_ATTR[:PROMOTE_NEWS],:value => setting[:promotion])
        end
      end
      
      if setting[:email]
        @email_setting = Setting.where(:code => Setting::CODE_ATTR[:EMAIL_FEED]).first
        if @email_setting
          @email_setting.update_attributes(:value => setting[:email])
        else
          @email_setting= Setting.create(:code =>Setting::CODE_ATTR[:EMAIL_FEED],:value => setting[:email])
        end

      end

      if setting[:homepage]
        @home_page = Setting.where(:code => Setting::CODE_ATTR[:HOME_INTRO]).first
        if @home_page
          @home_page.update_attributes(:value => setting[:homepage])
        else
          @home_page= Setting.create(:code =>Setting::CODE_ATTR[:HOME_INTRO],:value => setting[:homepage])
        end

      end

      if setting[:intro_page]
        @intro_page = Setting.where(:code => Setting::CODE_ATTR[:INTRO_FIELD]).first
        if @intro_page
          @intro_page.update_attributes(:value => setting[:intro_page])
        else
          @intro_page= Setting.create(:code =>Setting::CODE_ATTR[:INTRO_FIELD],:value => setting[:intro_page])
        end

      end

      if setting[:pricing_page]
        @pricing_page = Setting.where(:code => Setting::CODE_ATTR[:PRICING_FIELD]).first
        if @pricing_page
          @pricing_page.update_attributes(:value => setting[:pricing_page])
        else
          @pricing_page= Setting.create(:code =>Setting::CODE_ATTR[:PRICING_FIELD],:value => setting[:pricing_page])
        end

      end
      

    end
    redirect_to edit_setting_path({:id =>1,:success =>"true"})
  end

  
  
  def normal_upload
    if (params["file"].original_filename)
      sec_name = SecureRandom.base64(6).tr('+/=abcdefghijklmnopqrstuvywxz', '0AZ').strip.delete("\n")
      file = File.join("public/upload_editor/",sec_name)
      FileUtils.cp params["file"].tempfile, file
      render :text => ["http://",Rails.application.config.host_deploy.to_s,"/upload_editor/",sec_name].join("")
      return
    end
    render :text => ""
  end

end