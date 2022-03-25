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

  ###################
 #                   #
#  CREATION OF USERS  #
 #                   #
  ###################

# TO DO: At this stage (03/24/2022 @ 12:23 PM), the "users" table solely contains "Devise mandatory fields": email and password. 
#        Remember to update the "users" table structure (via a dedicated migration) before launching this richer script!
puts
puts "SEEDING - Creation of several fake users : students, mentors and 1 admin"
puts

puts "  > Starts seeding 'Students' information"
5.times do |x|
	xstr = x+1 < 9 ? "0#{x+1}" : (x+1).to_s 
  User.create(#first_name: Faker::Name.first_name, 
              #last_name: Faker::Name.last_name, 
              password: "THP2022", 
              email: "student_#{xstr}@yopmail.com", 
              #birthdate: Faker::Date.birthday(min_age: 16, max_age: 100),
              #gender: Faker::Gender.binary_type,
              #photo:"student_#{xstr}.jpg",
              role:0)
  #puts "  > Student n°: #{User.last.id} - first_name: #{User.last.first_name} - last_name: #{User.last.last_name} - email: #{User.last.email} - password: #{User.last.encrypted_password} - birthdate: #{User.last.birthdate}"
  puts "  > [Limited] Student n°: #{User.last.id} - email: #{User.last.email} - encrypted_password: #{User.last.encrypted_password}"
end
puts "  > Finished seeding 'Students'"

# Seeding DB with 10 mentors
puts "  > Starts seeding 'Mentors' information"
5.times do |x|
	xstr = x+1 < 9 ? "0#{x+1}" : (x+1).to_s 
  User.create(#first_name: Faker::Name.first_name, 
              #last_name: Faker::Name.last_name, 
              password: "THP2022", 
              email: "mentor_#{xstr}@yopmail.com", 
              #birthdate: Faker::Date.birthday(min_age: 18, max_age: 100),
              #gender: Faker::Gender.binary_type,
              #photo:"mentor_#{xstr}.jpg",
              role:1)
	#puts "  > Mentor n°: #{User.last.id} - first_name: #{User.last.first_name} - last_name: #{User.last.last_name} - email: #{User.last.email} - password: #{User.last.encrypted_password} - birthdate: #{User.last.birthdate}"
  puts "  > [Limited] Mentor n°: #{User.last.id} - email: #{User.last.email} - password: #{User.last.encrypted_password}"
end
puts "  > Finished seeding 'Mentors'"

# Seeding DB with 1 administrator
puts "  > Starts seeding unique admin information"
User.create(#first_name: "admin", 
            #last_name: "admin", 
            password: "THP2022", 
            email: "learnit_admin@yopmail.com",
            #birthdate: Faker::Date.birthday(min_age: 18, max_age: 100),
            #gender: Faker::Gender.binary_type,
            #photo:"photo_admin.jpg",
            role:2)
puts "  > Finished seeding the one and only 'Admin'"

  ########################################
 #                                        #
#  CREATION OF THEMES, CHAPTERS & COURSES  #
 #                                        #
  ########################################

# TO DO: At this stage (03/24/2022 @ 3:15 PM), the "themes" do not offer a dedicated image, hence do not have any "image_url" or related field.
#        In the near future, it'd be nice to add this feature instead of using fake random images to populate the front of our app
puts
puts "SEEDING - Creation of several fake pedagogical items : themes, chapters, courses, quizzes, and questions"
puts

puts "  > Starts seeding 'themes'"

# Main themes for which a detailed seeding will be performed (so far, as of 03/24/2022 @ 07:00 PM)
Theme.create(title: "Développement Web", content: "Le développement web ou 'WebDev' pour les intimes est une discipline qui consiste, par l’usage de langages de programmation dédiés, à programmer des sites Internet, plateformes web ou applications mobile destinés à être publiés sur des serveurs mis à disposition du public via Internet. Le métier de développeur web demande de savoir manier des outils tels que certains CMS, plusieurs langages (Ruby, Javascript, PHP...) et leurs frameworks (Bootstrap, Symfony, Rails, Django...).")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Capital-Investissement", content: "Le capital investissement, souvent dénommé par son nom anglais 'private equity' ou 'PE', se définit comme la prise de participations en capital dans des entreprises non-cotées. Ceci, dans le but de financer leur démarrage, leur développement ou leur cession/transmission. Le capital investissement joue un rôle de premier ordre aussi bien dans la création d’entreprises innovantes et créatrices d’emploi que dans le renouvellement et l’entretien du tissu économique.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Ressources Humaines", content: "La fonction Ressources humaines ou 'RH' a pour mission de faire en sorte que l’organisation dispose du personnel nécessaire (en nombre, en qualité / compétences, en disponibilité et en localisation) à son fonctionnement et que ce personnel fasse de son mieux pour améliorer la performance de l’organisation, tout en s’épanouissant.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "PAO", content: "La PAO ou 'Publication Assistée par Ordinateur regroupe de nombreuses disciplines liées au graphisme, au design, à la gestion des interfaces visuelles ou IHM, à l'animation, la vidéo ou même l'impression ; le tout supporté par des progiciels graphiques.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"

# Extra themes which won't be seeded so far (as of 03/24/2022 @ 07:00 PM)
Theme.create(title: "Achats", content: "La fonction 'Achats' ou 'Procurement' est chargée de mettre à disposition de l'organisation les matières premières, composants, matériels, machines et prestataires nécessaires à sa pleine production. Ces composants doivent être livrés ou mis à disposition dans les délais, tout en étant conformes en qualité et en quantité au cahier des charges (c’est à dire aux besoins) de l’entreprise.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Marketing", content: "Le Marketing vise la parfaite connaissance du 'marché' (les clientèles, leurs attentes...), de son entreprise et de la concurrence (forces, faiblesses, opportunités, menaces) afin de mettre au point une stratégie pour commercialiser ses produits ou services : définir le produit, son prix, son canal de distribution et ses moyens de promotion.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Management", content: "Le management ou la gestion est l'ensemble des techniques d'organisation de ressources qui sont mises en œuvre pour l'administration d'une organisation, dont l'art de diriger des hommes, afin d'obtenir une performance satisfaisante. Ces ressources peuvent être financières, humaines, matérielles ou autres.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Droit(s) Civil(s)", content: "L'expression 'droits civils', au pluriel, est utilisée pour désigner l'ensemble des prérogatives légales attachées à la personne physique (par opposition à la personnes morale, plutôt concernée par le 'droit commercial'). Il comprend notamment, le droit au respect de la vie privée, et de la vie familiale, au respect du domicile et au respect de sa correspondance, le droit à l'image, le droit à la liberté et à la sûreté, le droit d'aller et venir, le droit à la liberté de pensée, de conscience et de religion, le droit à la liberté d'expression, à la liberté de réunion et à la liberté d'association, le droit au mariage et le droit de fonder une famille.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Menuiserie", content: "La menuiserie se définit comme une activité, artisanale ou industrielle, consistant à fabriquer des ouvrages en bois à partir de pièces de faible section et destinées à être assemblées (ex. meubles).")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
Theme.create(title: "Roller Acrobatique", content: "Parmi les différentes disciplines de cette discipline sportive qu'est le roller ('quads' ou 'en lign'), il en est une qui frôle la cascade et se classe dans les sports de glisse dits 'extrêmes' : le 'roller acrobatique', plus communément appelé 'aggressive (inline) skating'. Il se décompsoe lui-même en 2 branches : la rampe et le 'street'. La première vise à effectuer des figures sur une structure en 'U' dite 'pipe', quand l'autre a pour objectif de tirer partie des éléments de mobilier urbain (e.g. bancs, rambardes d'escaliers...) pour réaliser les acrobaties stylisées les plus impressionnantes.")
puts "    - Thème n°: #{Theme.last.id} - title: #{Theme.last.title} - content: #{Theme.last.content}"
puts "  > Finished seeding 'themes'"

# TO DO: At this stage (03/24/2022 @ 4:06 PM), our "chapters" do not offer any (smart) mean to order them within a given "theme".
#        In a future version, it'd be a good idea to add a "chapter number" to make sure you go through each part in a particular order, not the one of their "id"...
puts "  > Starts seeding 'chapters'"

# Chapters from the "Développement Web" theme
Chapter.create(title: "Le Ruby magique", content: "Ceci est le chapitre n°1 du thème '#{Theme.first.title}'.", theme_id: Theme.first.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Coder comme sur des Rails", content: "Ceci est le chapitre n°2 du thème '#{Theme.first.title}'.", theme_id: Theme.first.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Aie confiance en tes CSSsss...", content: "Ceci est le chapitre n°3 du thème '#{Theme.first.title}'.", theme_id: Theme.first.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Là où il y a de la Gem, API de plaisir !", content: "Ceci est le chapitre n°4 du thème '#{Theme.first.title}'.", theme_id: Theme.first.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Git ou double ?", content: "Ceci est le chapitre n°5 du thème '#{Theme.first.title}'.", theme_id: Theme.first.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"

# Chapters from the "Ressources Humaines" theme
my_theme = Theme.find_by(title:"Ressources Humaines")
Chapter.create(title: "Introduction", content: "Ceci est le préambule du thème '#{my_theme.title}'.", theme_id:my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Talent Acquisition", content: "'Talent Acquisition' est le chapitre n°1 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Workforce Administration", content: "'Workforce Administration' est le chapitre n°2 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Compensation & Benefits", content: "'Compensation & Benefits' est le chapitre n°3 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Payroll & Time Management", content: "'Payroll & Time Management' est le chapitre n°4 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Talent Management", content: "'Talent Management' est le chapitre n°5 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Learning & Development", content: "'Learning & Development' est le chapitre n°6 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Employee & Labor Relations", content: "'Employee & Labor Relations' est le chapitre n°7 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "HR Systems & Data Management", content: "'HR Systems & Data Management' est le chapitre n°8 du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "HR Strategy & Organisation", content: "'HR Strategy & Organisation' est le 9ème et dernier chapitre du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Conclusion", content: "Conclusion et ouverture sur le thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"

# Chapters from the "Capital-Investissement" theme
my_theme = Theme.find_by(title:"Capital-Investissement")
Chapter.create(title: "Qu'est-ce que le 'Private Equity' ?", content: "Introduction au thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Scorer une start-up candidate", content: "Premier module du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Accompagner les start-ups retenues", content: "Deuxième module du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Sécuriser ses investissements en PE", content: "Troisème et dernier module du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Le Capital Investissement : et après?", content: "Conclusion du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"

# Chapters from the "PAO" theme
my_theme = Theme.find_by(title:"PAO")
Chapter.create(title: "Les métiers de la PAO", content: "Introduction au thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Le graphisme", content: "Premier chapitre du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Le 'print' et l'édition", content: "Deuxième chapitre du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "Le motion design", content: "Troisième chapitre du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "La vidéo", content: "Quatrième chapitre du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"
Chapter.create(title: "L'animation 3D et le motion design", content: "CInquième et dernier chapitre du thème '#{my_theme.title}'.", theme_id: my_theme.id)
puts "    - Chapter n°: #{Chapter.last.id} - title: #{Chapter.last.title} - content: #{Chapter.last.content} - theme_id: #{Chapter.last.theme_id}"

puts "  > Finished seeding 'chapters'"

puts "  > Starts seeding 'courses'"
my_sentences_nbr = 10                 # Unit length (in sentences) of the paragraphs generated by Faker as course content

my_chapter = Chapter.find_by(title:"Le Ruby magique")
my_theme = Theme.find(my_chapter.theme_id)
Course.create(title: "Ruby - I - Introduction", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Ruby - II - Les types de données", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Ruby - III - Les méthodes", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Ruby - IV - Les classes et objets", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"

my_chapter = Chapter.find_by(title:"Coder comme sur des Rails")
my_theme = Theme.find(my_chapter.theme_id)
Course.create(title: "Rails - I - Introduction", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Rails - II - Le modèle MVC", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Rails - III - Les 'Migrations'", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Rails - IV - Les 'Models'", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Rails - V - Les 'Controllers'", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*4), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Rails - VI - Les 'Views' et 'Partials'", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*4), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Rails - VII - La logique 'Asset Pipeline'", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"

my_chapter = Chapter.find_by(title:"Aie confiance en tes CSSsss...")
my_theme = Theme.find(my_chapter.theme_id)
Course.create(title: "CSS - chap. 1 - Pourquoi séparer forme et fond ?", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "CSS - chap. 2 - Les classes", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "CSS - chap. 3 - Bootstrap 5+", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"

my_chapter = Chapter.find_by(title:"Là où il y a de la Gem, API de plaisir !")
my_theme = Theme.find(my_chapter.theme_id)
Course.create(title: "Gem & API - Partie A - Les gems, le gemfile et bundler", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Gem & API - Partie B - Faker", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Gem & API - Partie C - Devise", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Gem & API - Partie D - Stripe", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Gem & API - Partie E - SendGrid", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Gem & API - Partie F - Créer sa Gem", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Gem & API - Partie F - Créer son API", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"

my_chapter = Chapter.find_by(title:"Git ou double ?")
my_theme = Theme.find(my_chapter.theme_id)
Course.create(title: "Saison 1 - Git : principes et intérêts", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*2), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Saison 2 - Github : finalités et gémellité avec Git", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"
Course.create(title: "Saison 3 - Git & Github : comment se prendre la tête", content: Faker::Lorem.paragraph(sentence_count: my_sentences_nbr*3), chapter_id: my_chapter.id)
puts "    - Course n°: #{Course.last.id} - title: #{Course.last.title} - content: #{Course.last.content} - chapter n°: #{Course.last.chapter_id}"

puts "  > Finished seeding 'courses'"

  ###########################################
 #                                           #
#  CREATION OF QUIZZES + QUESTIONS & ANSWERS  #
 #                                           #
  ###########################################

puts "  > Starts seeding 'quizzes' and related 'question_answers'"

# Quizz n°1 avec ses questions
my_course = Course.find_by(title:"Ruby - I - Introduction")
Quiz.create(title: "Questionnaire du cours '#{my_course.title}' (n° #{my_course.id})", course_id: my_course.id)
puts "    - Quizz n°: #{Quiz.last.id} - title: #{Quiz.last.title} - course n°: #{Quiz.last.course_id}"
my_quiz = Quiz.last

QuestionAnswer.create(question: "A. Où et quand est apparu le langage Ruby ?\n1.Au Japon en 1995\n2.Aux USA, dès 1996\n3.En France, en 1998 (Et 1... Et 2... Et 3...0!)\n4.Au Boultikistan, dès l'an 2 A.C.", 
                      correct_answer:"1",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"
QuestionAnswer.create(question: "B. Comment s'appelle une bibliothèque Ruby ?\n1.Un Diam's\n2.Une 'Gem(me)'\n3.Une 'Pierre de lave'", 
                      correct_answer:"2",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"
QuestionAnswer.create(question: "C. Quel est le nom du principal framework web basé sur Ruby ?\n1.Django\n2.Symfony\n3.Rails\n4.Je ne sais toujours pas après 3 mosi de THP...", 
                      correct_answer:"3",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"

# Quizz n°2 avec ses questions
my_course = Course.find_by(title:"Ruby - II - Les types de données")
Quiz.create(title: "Questionnaire du cours '#{my_course.title}' (n° #{my_course.id})", course_id: my_course.id)
puts "    - Quizz n°: #{Quiz.last.id} - title: #{Quiz.last.title} - course n°: #{Quiz.last.course_id}"
my_quiz = Quiz.last

QuestionAnswer.create(question: "A. De ces types de données, lequel n'existe pas en Ruby ?\n1.Type 'string'\n2.Type 'map'\n3.Type 'integer'\n4.Type 'array'\n5.Type 'float'", 
                      correct_answer:"1",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"
QuestionAnswer.create(question: "B. Ruby dispose-t-il d'un conversion implicite de types ?\n1.Non\n2.Oui\n3.Je ne sais pas", 
                      correct_answer:"2",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"
QuestionAnswer.create(question: "C. Ruby offre-t-il des paradigmes 'objet' ?\n1.Non\n2.Para... Quoi ?\n3.Oui\n4.Ca dépend de l'obliquité de la Terre", 
                      correct_answer:"3",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"
QuestionAnswer.create(question: "D. Ruby peut-il être qualifié de langage faiblement typé ?\n1.Ne se prononce pas\n2.Langage du 3ème type, plutôt, non?\n3.Oui\n4.Non, on est pas chez Javascript, là !", 
                      correct_answer:"4",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"

# Quizz n°3 avec ses questions
my_course = Course.find_by(title:"Ruby - III - Les méthodes")
Quiz.create(title: "Questionnaire du cours '#{my_course.title}' (n° #{my_course.id})", course_id: my_course.id)
puts "    - Quizz n°: #{Quiz.last.id} - title: #{Quiz.last.title} - course n°: #{Quiz.last.course_id}"
my_quiz = Quiz.last

QuestionAnswer.create(question: "A. Quel terme est applicable à Ruby ?\n1.Méthodes\n2.Fonctions\n3.Procédures\n4.Routines\n5.Sous-programmes", 
                      correct_answer:"1",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"
QuestionAnswer.create(question: "B. Un 'return' est-il attendu en fin de toute méthode Ruby ?\n1.Non\n2.Oui\n3.Pour attendre, c'est pas un 'wait(5000)' ?", 
                      correct_answer:"2",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"

# Quizz n°4 avec ses questions
my_course = Course.find_by(title:"Ruby - IV - Les classes et objets")
Quiz.create(title: "Questionnaire du cours '#{my_course.title}' (n° #{my_course.id})", course_id: my_course.id)
puts "    - Quizz n°: #{Quiz.last.id} - title: #{Quiz.last.title} - course n°: #{Quiz.last.course_id}"
my_quiz = Quiz.last

QuestionAnswer.create(question: "A. Quel mot-clé fait référence à l'objet courant en Ruby ?\n1.self\n2.sauf\n3.SIF", 
                      correct_answer:"2",
                      quiz_id: my_quiz.id)
puts "      + Question n°: #{QuestionAnswer.last.id} - correct_answer: #{QuestionAnswer.last.correct_answer} - quizz n°: #{QuestionAnswer.last.quiz_id}"

puts "  > Finished seeding 'quizzes'"

puts "  > Starts seeding 'memberships'"
User.all.each do |my_user|
  if my_user.role != 2
    Membership.create(user_id: my_user.id, subscription_date: Faker::Date.between(from: 2.years.ago, to: 1.day.ago))
    puts "    - Membership n°: #{Membership.last.id} - user: #{my_user.email}(id: #{my_user.id}) - subscribed on: #{Membership.last.subscription_date}"
  end
end
puts "  > Finished seeding 'memberships'"

puts "  > Starts seeding 'seasons'"
my_theme = Theme.find_by(title: "Développement Web")
puts "    - Starts creating 5 seasons for theme '#{my_theme.title}'"
Season.create(name: "WebDev - Saison n°1", start_date:"2020-01-01", end_date:"2020-06-01", theme_id:my_theme.id)
Season.create(name: "WebDev - Saison n°2", start_date:"2020-09-01", end_date:"2021-03-01", theme_id:my_theme.id)
Season.create(name: "WebDev - Saison n°3", start_date:"2021-01-01", end_date:"2021-06-01", theme_id:my_theme.id)
Season.create(name: "WebDev - Saison n°4", start_date:"2022-01-10", end_date:"2022-07-06", theme_id:my_theme.id)
Season.create(name: "WebDev - Saison n°5", start_date:"2022-04-15", end_date:"2022-09-01", theme_id:my_theme.id)
puts "    - Ended creating 5 seasons for theme '#{my_theme.title}'"
my_theme = Theme.find_by(title: "Capital-Investissement")
puts "    - Starts creating 5 seasons for theme '#{my_theme.title}'"
Season.create(name: "PE - Saison n°1", start_date:"2020-01-02", end_date:"2020-06-02", theme_id:my_theme.id)
Season.create(name: "PE - Saison n°2", start_date:"2020-09-02", end_date:"2021-03-02", theme_id:my_theme.id)
Season.create(name: "PE - Saison n°3", start_date:"2021-01-02", end_date:"2021-06-02", theme_id:my_theme.id)
Season.create(name: "PE - Saison n°4", start_date:"2022-01-10", end_date:"2022-07-06", theme_id:my_theme.id)
Season.create(name: "PE - Saison n°5", start_date:"2022-04-15", end_date:"2022-09-02", theme_id:my_theme.id)
puts "    - Ended creating 5 seasons for theme '#{my_theme.title}'"
my_theme = Theme.find_by(title: "Ressources Humaines")
puts "    - Starts creating 5 seasons for theme '#{my_theme.title}'"
Season.create(name: "RH - Saison n°1", start_date:"2020-01-03", end_date:"2020-06-03", theme_id:my_theme.id)
Season.create(name: "RH - Saison n°2", start_date:"2020-09-03", end_date:"2021-03-03", theme_id:my_theme.id)
Season.create(name: "RH - Saison n°3", start_date:"2021-01-03", end_date:"2021-06-03", theme_id:my_theme.id)
Season.create(name: "RH - Saison n°4", start_date:"2022-01-10", end_date:"2022-07-06", theme_id:my_theme.id)
Season.create(name: "RH - Saison n°5", start_date:"2022-04-15", end_date:"2022-09-03", theme_id:my_theme.id)
puts "    - Ended creating 5 seasons for theme '#{my_theme.title}'"
my_theme = Theme.find_by(title: "PAO")
puts "    - Starts creating 5 seasons for theme '#{my_theme.title}'"
Season.create(name: "PAO - Saison n°1", start_date:"2020-01-04", end_date:"2020-06-04", theme_id:my_theme.id)
Season.create(name: "PAO - Saison n°2", start_date:"2020-09-04", end_date:"2021-03-04", theme_id:my_theme.id)
Season.create(name: "PAO - Saison n°3", start_date:"2021-01-04", end_date:"2021-06-04", theme_id:my_theme.id)
Season.create(name: "PAO - Saison n°4", start_date:"2022-01-10", end_date:"2022-07-06", theme_id:my_theme.id)
Season.create(name: "PAO - Saison n°5", start_date:"2022-04-15", end_date:"2022-09-04", theme_id:my_theme.id)
puts "    - Ended creating 5 seasons for theme '#{my_theme.title}'"
puts "  > Finished seeding 'seasons'"

puts "  > Starts seeding 'user_seasons'"
my_users = User.where.not(role:2)
min_season = Season.first.id
my_users.each do |user_counter|
  UserSeason.create(user_id: user_counter.id, season_id: rand(min_season..min_season+4))
  UserSeason.create(user_id: user_counter.id, season_id: rand(min_season+5..min_season+9))
  UserSeason.create(user_id: user_counter.id, season_id: rand(min_season+10..min_season+14))
  UserSeason.create(user_id: user_counter.id, season_id: rand(min_season+15..min_season+19))
  puts "    - Another 4 'user_seasons' instantiated"
end
puts "  > Finished seeding 'user_seasons'"

puts "  > Starts seeding 'user_theme_seasons'"
UserSeason.all.each do |my_us|
  my_season = Season.find(my_us.season_id)
  my_theme = Theme.find(my_season.theme_id)
  UserThemeSeason.create(user_id:my_us.user_id, season_id: my_us.season_id, theme_id: my_theme.id, completion_rate: rand(0..100)) 
  puts "    - Another 'user_theme_seasons' created and filled-up"
end
puts "  > Finished seeding 'user_theme_seasons'"

puts
puts "SEEDING - This is the end... At last !"
puts
puts "Thank you for your patience ;-)"
puts

######################
#                    #
#      LEARN IT !    #
#  End of seed file  #
#                    #
######################
