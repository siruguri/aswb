class Jurisdiction < ActiveRecord::Base
  attr_accessor :attribute_keys

  has_many :licensed_practices
  has_many :practice_infos, through: :licensed_practices
  
  belongs_to :owner, class_name: 'User', inverse_of: :jurisdictions

  def set_attribute_keys
    # allowed keys
    allowed_keys = [:title, :initials, :exam_required]
    
    # Create a map from the database attributes to a hash that the front end will consume
    h={name: self.name, address: self.address, practices: [], changes_pending: Change.where(jurisdiction: self, confirmed: false).count}

    # Merge in each licensed practice's info
    self.licensed_practices.each do |lp|
      h[:practices] << {info: {}}

      final_hash = allowed_keys.inject({}) do |acc, key|
        val = lp.get_attribute_val(key)
        
        acc.merge({key => val})
      end
      
      h[:practices].last.merge! final_hash
    end

    @attribute_keys=h
  end

  def has_practice?(id)
    self.practice_infos.where(id: id).count > 0
  end
  
  def reverse_map_attribute_key(prac_id, key, val, update_type)
    target_prac = self.practice_infos.where(id: prac_id)[0]
    if update_type == 'draft'
      create_draft(key, val, target_prac)
    elsif update_type == 'confirm'
      confirm_draft(key, target_prac)
    end
  end
  def create_draft(key, val, target_prac)
    c=Change.new(changed_key: key, changed_val: val, practice_info: target_prac, jurisdiction: self, confirmed: false)
    c.save
  end
  def confirm_draft(key, target_prac)
    c=Change.where(changed_key: key, jurisdiction: self, practice_info: target_prac).last
    val=c.changed_val
    do_reverse_update key, val, target_prac
    # Need a transaction here to envelope the change to the target LP and to the change log
    c.confirmed=true
    c.save
  end
  def do_reverse_update(key, val, target_prac)
    target_lp = self.licensed_practices.where practice_info: target_prac

    if key==:exam_required
      target_lp.exam_required=val
      target_lp.save
    end
  end

  def self.has_attribute_key?(key)
    if [:exam_required, :board_approval, :renewal_period_in_years, :ce_in_hours].include? key
      true
    else
      false
    end
  end
end
