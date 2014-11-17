FactoryGirl.define do
  factory :licensed_practice do
    jurisdiction_id 1
practice_info_id 1
education_experiences ""
supervised_experiences ""
exam_required ""
board_approval false
renewal_period_in_years 1
ce_in_hours 1
special_ce_requirements "MyText"
provision_or_temp false
inactive_or_retired "MyString"
application_fee 1.5
fees "MyText"
renewal_schedule_in_years 1
  end

end
