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


skills = ["Seo", "Sea", "Product management", "Analytics", "Programmatic", "Data analyst", "Developer", "Dontent manager", "revenue management", "web designer", "AT internet", "Mediametrie", "ACPM", "Adobe analytics", "Enterprise analytics - comscore","Funnel conversion", "Tagging plan", "Acquisition", "Growth hacking", "Affiliation", "Lead management", "Traffic management", "Brand content", "Digital Brand Manager", "CRM", "datamining", "UX design", "UI design", "Social media management", "Digital communication", "lean management","Excel", "Microsoft office", "Adwords", "Photoshop", "ruby", "javascript", "Indesign", "HTML/CSS", "Python", "PHP", "Swift", "SQL", "C++", "JAVA", "C", "Ads management", "Web integration", "Project management", "Data analyst", "Email marketing","logistic", "A/B testing", "Design thinking" ]
skills.each {|skill| Skill.create!(name: skill)}
