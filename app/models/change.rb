class Change < ActiveRecord::Base
  belongs_to :jurisdiction
  belongs_to :practice_info
end
