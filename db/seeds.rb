########################
#                      #
#      LEARN IT !      #
#  Official seed file  #
#                      #
########################

# Notice: requires the "faker" gem to be part of the Rails environment

# Erase the content of all tables, hence reseting the related "id" counters
# NB: requires the "database_cleaner" gem to be part of the Rails environment
DatabaseCleaner.clean_with(:truncation)

 #####################
#                     #
#  CREATION OF USERS  #
#                     #
 #####################

# TO DO: At this stage (03/24/2022 @ 12:23 PM), the "users" table solely contains "Devise mandatory fields": email and password. 
#        Remember to update the "users" table structure (via a dedicated migration) before launching this richer script!
puts
puts "SEEDING - Creation of several fake users : students, mentors and 1 admin"
puts

puts "  > Starts seeding 'Students' information"
5.times do |x|
	xstr = x+1 < 9 ? "0#{x+1}" : (x+1).to_s 
  User.create(first_name: Faker::Name.first_name, 
              last_name: Faker::Name.last_name, 
              password: "THP2022", 
              email: "student_#{xstr}@yopmail.com", 
              birthdate: Faker::Date.birthday(min_age: 16, max_age: 100),
              gender: Faker::Gender.binary_type,
              role:0,
              photo:"student_#{xstr}.jpg")
	puts "  > Student n°: #{User.last.id} - first_name: #{User.last.first_name} - last_name: #{User.last.last_name} - email: #{User.last.email} - password: #{User.last.encrypted_password} - birthdate: #{User.last.birthdate}"
end
puts "  > Finished seeding 'Students'"

# Seeding DB with 10 mentors
puts "  > Starts seeding 'Mentors' information"
5.times do |x|
	xstr = x+1 < 9 ? "0#{x+1}" : (x+1).to_s 
  User.create(first_name: Faker::Name.first_name, 
              last_name: Faker::Name.last_name, 
              password: "THP2022", 
              email: "mentor_#{xstr}@yopmail.com", 
              birthdate: Faker::Date.birthday(min_age: 18, max_age: 100),
              gender: Faker::Gender.binary_type,
              role:1,
              photo:"mentor_#{xstr}.jpg")
	puts "  > Mentor n°: #{User.last.id} - first_name: #{User.last.first_name} - last_name: #{User.last.last_name} - email: #{User.last.email} - password: #{User.last.encrypted_password} - birthdate: #{User.last.birthdate}"
end
puts "  > Finished seeding 'Mentors'"

# Seeding DB with 1 administrator
puts "  > Starts seeding unique admin information"
User.create(first_name: "admin", 
              last_name: "admin", 
              password: "THP2022", 
              email: "learnit_admin@yopmail.com", 
              birthdate: Faker::Date.birthday(min_age: 18, max_age: 100),
              gender: Faker::Gender.binary_type,
              role:2,
              photo:"photo_admin.jpg")
puts "  > Finished seeding the one and only 'Admin'"

 ##############################################
#                                              #
#  CREATION OF THEMES, CHAPTERS, COURSES & CO  #
#                                              #
 ##############################################

# TO DO: At this stage (03/24/2022 @ 3:15 PM), the "themes" do not offer a dedicated image, hence do not have any "image_url" or related field.
#        In the near future, it'd be nice to add this feature instead of using fake random images to populate the front of our app
puts
puts "SEEDING - Creation of several fake pedagogical Themes : themes, chapters, courses, and quizzes"
puts

puts "  > Starts seeding 'themes'"
Theme.create(title: "Développement Web", content: "Le développement web ou 'WebDev' pour les intimes est une discipline qui consiste, par l’usage de langages de programmation dédiés, à programmer des sites Internet, plateformes web ou applications mobile destinés à être publiés sur des serveurs mis à disposition du public via Internet. Le métier de développeur web demande de savoir manier des outils tels que certains CMS, plusieurs langages (Ruby, Javascript, PHP...) et leurs frameworks (Bootstrap, Symfony, Rails, Django...).")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Capital Investissement", content: "Le capital investissement, souvent dénommé par son nom anglais 'private equity' ou 'PE', se définit comme la prise de participations en capital dans des entreprises non-cotées. Ceci, dans le but de financer leur démarrage, leur développement ou leur cession/transmission. Le capital investissement joue un rôle de premier ordre aussi bien dans la création d’entreprises innovantes et créatrices d’emploi que dans le renouvellement et l’entretien du tissu économique.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Ressources Humaines", content: "La fonction Ressources humaines ou 'RH' a pour mission de faire en sorte que l’organisation dispose du personnel nécessaire (en nombre, en qualité / compétences, en disponibilité et en localisation) à son fonctionnement et que ce personnel fasse de son mieux pour améliorer la performance de l’organisation, tout en s’épanouissant.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "PAO", content: "La PAO ou 'Publication Assistée par Ordinateur regroupe de nombreuses disciplines liées au graphisme, au design, à la gestion des interfaces visuelles ou IHM, à l'animation, la vidéo ou même l'impression ; le tout supporté par des progiciels graphiques.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Achats", content: "La fonction 'Achats' ou 'Procurement' est chargée de mettre à disposition de l'organisation les matières premières, composants, matériels, machines et prestataires nécessaires à sa pleine production. Ces composants doivent être livrés ou mis à disposition dans les délais, tout en étant conformes en qualité et en quantité au cahier des charges (c’est à dire aux besoins) de l’entreprise.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Marketing", content: "Le Marketing vise la parfaite connaissance du 'marché' (les clientèles, leurs attentes...), de son entreprise et de la concurrence (forces, faiblesses, opportunités, menaces) afin de mettre au point une stratégie pour commercialiser ses produits ou services : définir le produit, son prix, son canal de distribution et ses moyens de promotion.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Management", content: "Le management ou la gestion est l'ensemble des techniques d'organisation de ressources qui sont mises en œuvre pour l'administration d'une organisation, dont l'art de diriger des hommes, afin d'obtenir une performance satisfaisante. Ces ressources peuvent être financières, humaines, matérielles ou autres.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Droit(s) Civil(s)", content: "L'expression 'droits civils', au pluriel, est utilisée pour désigner l'ensemble des prérogatives légales attachées à la personne physique (par opposition à la personnes morale, plutôt concernée par le 'droit commercial'). Il comprend notamment, le droit au respect de la vie privée, et de la vie familiale, au respect du domicile et au respect de sa correspondance, le droit à l'image, le droit à la liberté et à la sûreté, le droit d'aller et venir, le droit à la liberté de pensée, de conscience et de religion, le droit à la liberté d'expression, à la liberté de réunion et à la liberté d'association, le droit au mariage et le droit de fonder une famille.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Menuiserie", content: "La menuiserie se définit comme une activité, artisanale ou industrielle, consistant à fabriquer des ouvrages en bois à partir de pièces de faible section et destinées à être assemblées (ex. meubles).")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Roller Acrobatique", content: "Parmi les différentes disciplines de cette discipline sportive qu'est le roller ('quads' ou 'en lign'), il en est une qui frôle la cascade et se classe dans les sports de glisse dits 'extrêmes' : le 'roller acrobatique', plus communément appelé 'aggressive (inline) skating'. Il se décompsoe lui-même en 2 branches : la rampe et le 'street'. La première vise à effectuer des figures sur une structure en 'U' dite 'pipe', quand l'autre a pour objectif de tirer partie des éléments de mobilier urbain (e.g. bancs, rambardes d'escaliers...) pour réaliser les acrobaties stylisées les plus impressionnantes.")
puts "  > Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
puts "  > Finished seeding 'themes'"

# TO DO: At this stage (03/24/2022 @ 4:06 PM), our "chapters" do not offer any (smart) mean to order them within a given "theme".
#        In a future version, it'd be a good idea to add a "chapter number" to make sure you go through each part in a particular order, not the one of their "id"...
puts "  > Starts seeding 'chapters'"
Chapter.create(title: "Le Ruby magique", content: "Ceci est le chapitre n°1 du thème '#{Theme.first.title}'.", theme_id:Theme.first.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Coder comme sur des Rails", content: "Ceci est le chapitre n°2 du thème '#{Theme.first.title}'.", theme_id:Theme.first.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Ai confiance en tes CSSsss...", content: "Ceci est le chapitre n°3 du thème '#{Theme.first.title}'.", theme_id:Theme.first.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Là où il y a de la Gem, y'a pas de plaisir !", content: "Ceci est le chapitre n°4 du thème '#{Theme.first.title}'.", theme_id:Theme.first.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Git ou double", content: "Ceci est le chapitre n°5 du thème '#{Theme.first.title}'.", theme_id:Theme.first.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"

my_theme = Theme.find_by(title:"Ressources Humaines")
Chapter.create(title: "Introduction", content: "Ceci est le préambule du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Talent Acquisition", content: "'Talent Acquisition' est le chapitre n°1 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Workforce Administration", content: "'Workforce Administration' est le chapitre n°2 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Compensation & Benefits", content: "'Compensation & Benefits' est le chapitre n°3 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Payroll & Time Management", content: "'Payroll & Time Management' est le chapitre n°4 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Talent Management", content: "'Talent Management' est le chapitre n°5 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Learning & Development", content: "'Learning & Development' est le chapitre n°6 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Employee & Labor Relations", content: "'Employee & Labor Relations' est le chapitre n°7 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "HR Systems & Data Management", content: "'HR Systems & Data Management' est le chapitre n°8 du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "HR Strategy & Organisation", content: "'HR Strategy & Organisation' est le 9ème et dernier chapitre du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Conclusion", content: "Conclusion et ouverture sur le thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "  > Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"


puts "  > Finished seeding 'chapters'"

"Publication Assisté par Ordinateur (PAO)" > "Infographie / Design graphique", "UI / UX", "Motion Design", "Print / Edition", "Vidéo"
"Achats"
"Animation 3D"
"Marketing"
"Vidéo & Arts Numériques" > ""
"Management"


puts
puts "SEEDING - This is the end..."

######################
#                    #
#      LEARN IT !    #
#  End of seed file  #
#                    #
######################