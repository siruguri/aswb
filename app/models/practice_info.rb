class PracticeInfo < ActiveRecord::Base
  has_many :licensed_practices
  has_many :jurisdictions, through: :licensed_practices
end
