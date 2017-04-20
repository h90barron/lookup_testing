class CopierRequest < ActiveRecord::Base
  validates :req_name, :user_name, :user_email, :req_oem, :req_suppored_status, presence: true
end
