alb=Jurisdiction.find_or_create_by name: 'Alberta'
rsw=PracticeInfo.find_or_create_by title: 'Registered Social Worker' do |pi|
  pi.initials='RSW'
end

LicensedPractice.find_or_create_by jurisdiction: alb do |lp|
  lp.exam_required='Associates,Bachelors,Masters'
  lp.practice_info=rsw
end

al=Jurisdiction.find_by_name 'Arizona'
lcsw=PracticeInfo.find_or_create_by title: 'Licensed Certified Social Worker' do |pi|
  pi.initials='LCSW'
end

LicensedPractice.find_or_create_by jurisdiction: al do |lp|
  lp.exam_required='Clinical'
  lp.practice_info=lcsw
end

