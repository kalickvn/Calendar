# coding: UTF-8
class SettingsController < ApplicationController
  before_filter :authenticate_user!
  layout "admin"
  def edit
    @text_setting = Setting.where(:code => Setting::CODE_ATTR[:PROMOTE_NEWS].to_s).first
    @email_setting = Setting.where(:code => Setting::CODE_ATTR[:EMAIL_FEED].to_s).first
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
    end
    redirect_to edit_setting_path({:id =>1,:success =>"true"})
  end


end