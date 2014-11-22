alb=Jurisdiction.find_or_create_by name: 'Alberta'
rsw=PracticeInfo.find_or_create_by title: 'Registered Social Worker'
rsw.initials='RSW'
rsw.save

lp=LicensedPractice.find_or_create_by jurisdiction: alb
lp.exam_required=%w(Associates Bachelors Masters)
lp.practice_info=rsw
lp.save


al=Jurisdiction.find_by_name 'Arizona'
lcsw=PracticeInfo.find_or_create_by title: 'Licensed Certified Social Worker'
lcsw.initials='LCSW'
lcsw.save

lp=LicensedPractice.find_or_create_by jurisdiction: al
lp.exam_required=%w(Clinical)
lp.practice_info=lcsw
lp.save


