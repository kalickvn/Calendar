# coding: UTF-8
class Setting < ActiveRecord::Base
  CODE_ATTR = {
    :PROMOTE_NEWS => "PROMOTE",
    :EMAIL_FEED => "EMAIL_FEED",
    :HOME_INTRO => "HOME_INTRO",
    :INTRO_FIELD => "INTRO",
    :PRICING_FIELD => "PRICING"
  }
  attr_accessible :code,:value
end