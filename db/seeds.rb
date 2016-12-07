User.destroy_all
Skill.destroy_all

cedric = User.new(email: 'cedric@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Cedric', last_name: 'Njanga')
cedric.tag_list.add('Seo', 'Analytics')
cedric.save!

romain = User.new(email: 'romain@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Romain', last_name: 'Bousseau')
romain.tag_list.add('Seo', 'Development', 'Programmatic')
romain.save!

maxence = User.new(email: 'maxence@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Maxence', last_name: 'Villepion')
maxence.tag_list.add('Product management', 'Data analyst', 'Programmatic')
maxence.save!

stephane = User.new(email: 'stephane@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Stephane', last_name: 'Robert')
stephane.tag_list.add('Web designer', 'Content management', 'Sea')
stephane.save!

boris = User.new(email: 'boris@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Boris', last_name: 'Paillard')
boris.tag_list.add('Web designer', 'Product management', 'Development')
boris.save!

sebastien = User.new(email: 'sebastien@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Sebastien', last_name: 'Saunier')
sebastien.tag_list.add('Development', 'Lean management', 'Growth hacking')
sebastien.save!

edward = User.new(email: 'edward@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Edward', last_name: 'Schults')
edward.tag_list.add('Data analyst', 'Content management', 'Revenue management')
edward.save!

clara = User.new(email: 'clara@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Clara', last_name: 'Morgine')
clara.tag_list.add('Design thinking', 'Content management', 'Brand management', 'Digital communication', 'Social media management')
clara.save!

lucie = User.new(email: 'lucie@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Lucie', last_name: 'Lechie')
lucie.tag_list.add('Web integration', 'Html/Css', 'UI design', 'Seo')
lucie.save!

jean-eudes = User.new(email: 'jean-eudes@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Jean-eudes', last_name: 'Maurice')
jean-eudes.tag_list.add('C++', 'Ruby', 'Php', 'Javascript', 'Development')
jean-eudes.save!

sofia = User.new(email: 'sofia@wagon.com', password: '123456', password_confirmation: '123456', first_name: 'Sofia', last_name: 'Larov')
sofia.tag_list.add('Microsoft office', 'Photoshop')
sofia.save!


skills = ["Seo", "Sea", "Product management", "Analytics", "Programmatic", "Data analyst", "development", "Content management", "revenue management", "web designer", "AT internet", "Mediametrie", "ACPM", "Adobe analytics", "Enterprise analytics - comscore","Funnel conversion", "Tagging plan", "Acquisition", "Growth hacking", "Affiliation", "Lead management", "Traffic management", "Brand content", "Digital Brand management", "CRM", "datamining", "UX design", "UI design", "Social media management", "Digital communication", "lean management","Excel", "Microsoft office", "Adwords", "Photoshop", "ruby", "javascript", "Indesign", "HTML/CSS", "Python", "PHP", "Swift", "SQL", "C++", "JAVA", "C", "Ads management", "Web integration", "Project management", "Data analyst", "Email marketing","logistic", "A/B testing", "Design thinking" ]
skills.each {|skill| Skill.create!(name: skill)}
