aswb_u = User.find_or_create_by(email: 'aswb@aswbportal.com')
aswb_u.password='admin123'
aswb_u.admin=true
aswb_u.name='ASWB Admin'
aswb_u.save

['Alaska', 'Alberta', 'Arizona'].each do |j_name|
  u = User.find_or_create_by(email: "#{j_name.downcase}@aswbportal.com")
  u.name = j_name
  u.password='userme123'
  u.admin=false
  u.save
end
