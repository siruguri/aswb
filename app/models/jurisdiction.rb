class Jurisdiction < ActiveRecord::Base
  attr_accessor :attribute_keys

  has_many :licensed_practices
  has_many :license_requirements, through: :licensed_practices
  
  belongs_to :owner, class_name: 'User'

  def set_attribute_keys
    # Create a map from the database attributes to a hash that the front end will consume
    h={name: self.name, address: self.address, practices: []}

    # Merge in each licensed practice's info
    self.licensed_practices.each do |lp|
      h[:practices] << {title: lp.practice_info.title, initials: lp.practice_info.initials, info: {}}
      h[:practices].last.merge!({exam_required: lp.map_exam_required})
    end

    @attribute_keys=h
  end
end
