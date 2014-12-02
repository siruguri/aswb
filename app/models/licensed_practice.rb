class LicensedPractice < ActiveRecord::Base
  belongs_to :jurisdiction
  belongs_to :practice_info

  serialize :education_experiences, Hash # {:amount, :unit, :info}
  serialize :supervised_experiences, Hash # {:amount, :unit, :type, :info, :frequency, :total, :supervisor}
  serialize :fees, Hash # {:currency, :certification, :renewal, :other_info}

  #, board_approval (Boolean), renewal_period_in_years, ce_in_hours (-1=required, no spec hours)
  # special_ce_requirements, provision_or_temp (Boolean),

  serialize :exam_required, Array
  serialize :inactive_or_retired, Array # [Yes, No, Inactive]
  # application_fee (float)

  # renewal_schedule_in_years, 

  def map_exam_required
    # Return list of required exams split by ,
    if self.exam_required
      (self.exam_required.join ", ").gsub(/, $/, '')
    else
      []
    end
  end

  def map_title
    self.practice_info.title
  end
  def map_initials
    self.practice_info.initials
  end
  def map_board_approval
    if board_approval
      'Required'
    else
      'Not Required'
    end
  end

  def get_attribute_val(key)
    mesg = "map_#{key}"
    if self.respond_to? mesg.to_sym
      val=self.send mesg.to_sym
    else
      val=nil
    end
  end
end
