User.destroy_all
Skill.destroy_all

cedric  = User.new(email: 'cedric@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Cedric', last_name: 'Njanga')
cedric.tag_list.add('seo', 'analytics')
cedric.save!

romain  = User.new(email: 'romain@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Romain', last_name: 'Bousseau')
romain.tag_list.add('seo', 'developer', 'programmatic')
romain.save!

maxence  = User.new(email: 'maxence@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Maxence', last_name: 'Villepion')
maxence.tag_list.add('product manager', 'data analyst', 'programmatic')
maxence.save!

stephane  = User.new(email: 'stephane@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Stephane', last_name: 'Robert')
stephane.tag_list.add('web designer', 'content manager', 'sea')
stephane.save!


skills = ["seo", "sea", "product manager", "analytics", "programmatic", "data analyst", "developer", "content manager", "revemue manager", "web designer"]
skills.each {|skill| Skill.create!(name: skill)}
