info_states={'Alaska' => {address: 'Board of Social Work Examiners, PO Box 110806, Juneau, AK 99811-0806', phone_number: '(334) 242-5860', website: 'www.socialwork.alabama.gov'},
             'Alberta' => {address: 'Alberta College of Social Workers, #550 10707 100 Avenue NW, Edmonton, AB T5J 3M1', phone_number: '(780) 421-1167', website: 'www.acsw.ab.ca'},
             'Arizona' => {address: 'Board of Behavioral Health Examiners, 3443 North Central Avenue, Suite 1700, Phoenix, AZ 85012', phone_number: '(602)542-1882', website: 'www.azbbhe.us/'},
            }
             
['Alaska', 'Alberta', 'Arizona'].each do |j_name|
  j = Jurisdiction.find_or_create_by name: j_name 
  j.update_attributes info_states[j_name]
  j.owner = User.find_by_email("#{j_name.downcase}@aswbportal.com")
  j.save
end


