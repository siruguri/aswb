NavbarEntry.all.map &:delete

list = [{title: 'All Changes', url: '/'}]
list.each do |h|
  n=NavbarEntry.find_or_create_by title: h[:title]
  n.url = h[:url]
  n.save
end
