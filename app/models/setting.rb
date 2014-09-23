# coding: UTF-8
class Setting < ActiveRecord::Base
  CODE_ATTR = {
    :PROMOTE_NEWS => "PROMOTE",
    :EMAIL_FEED => "EMAIL_FEED"
  }
  attr_accessible :code,:value
end