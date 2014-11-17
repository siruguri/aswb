class LicensedPractice < ActiveRecord::Base
  belongs_to :jurisdiction
  belongs_to :practice_info

  serialize :education_experiences, Hash # {:amount, :unit, :info}
  serialize :supervised_experiences, Hash # {:amount, :unit, :type, :info, :frequency, :total, :supervisor}
  # exam_required, board_approval (Boolean), renewal_period_in_years, ce_in_hours (-1=required, no spec hours)
  # special_ce_requirements, provision_or_temp (Boolean),

  serialize :inactive_or_retired, Array # [Yes, No, Inactive]
  # application_fee (float)

  serialize :fees, Hash # {:currency, :certification, :renewal, :other_info}
  # renewal_schedule_in_years, 

  def map_exam_required
    # Return list of required exams split by ,
    if self.exam_required
      self.exam_required.split ","
    else
      []
    end
  end
end
