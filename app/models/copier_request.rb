class CopierRequest < ActiveRecord::Base
  validates :req_name, :user_name, :user_email, :req_oem, :req_supported_status, presence: true
end
