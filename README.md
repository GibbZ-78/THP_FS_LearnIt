# [LEARN IT!](https://welearnit.herokuapp.com/)

1. Présentation
Learn it est une plateforme de formation en ligne pluridisciplinaire axée sur le travail de groupe et le mentorat.

2. Typologies et parcours utilisateurs
Learn it réunit 4 typologies d’utilisateurs :
*	Les « visiteurs » peuvent naviguer sur la « landing page » et découvrir notre proposition de valeur avant de se laisser séduire par l’offre. Ils peuvent également entrer en contact avec l’administrateur via un formulaire hébergé sur le site.
*	Les "apprenants" s’inscrivent pour une période de 1 an et bénéficient ainsi des contenus pédagogiques de la plateforme. Ces derniers sont structurés en thèmes > chapitres > cours.
* Les "mentors" accompagnent des groupes d’apprenants dans leur formation. Ils ont un rôle de référant pédagogique.
* Un(e) administrateur(trice) accède à l’ensemble des informations des cours, apprenants, mentors depuis son dashboard qui lui offre une vision complète des statistiques de Learn it.

Zoom sur le parcours d'un(e) "apprenant(e)" :
* Découverte, via la page d’accueil présentant une sélection de thématiques de cours, l’offre pédagogique, les conditions tarifaires, des témoignages et autres preuves sociales, etc.
* Inscription annuelle : paiement via Stripe pour bénéficier d’un accès à l’ensemble de la plateforme sur une période de 1 an.
* Réception d’un mail de confirmation d’inscription
* Connexion au "dashboard / tableau de bord" de l'apprenant(e), l'utilisateur(trice) peut :
  * S'inscrire aux cursus qui l'intéressent
  * Visualiser les cursus auxquels il est déjà inscrit
  * Suivre sa progression depuis son dashboard.

3. Les fonctionnalités mises en place 
*	une page d’accueil accessible à tous et présentée plus haut
*	un système d’inscription/connexion adossé à Devise et Stripe
*	une gestion des 4 typologies d’utilisateurs (présentés plus haut)
*	une boucle de mails adressés à l’administrateur et au nouvel inscrit
*	des cours structurés de façon arborescente (thèmes > chapitres > cours)
*	des promotions d’apprenants qui favorisent le travail en équipe (les cours démarrent et s’achèvent à des dates fixées)
*	un formulaire de contact pour permettre à tout visiteur d’échanger avec l’administrateur
*	un tableau de bord pour :
    * l'apprenant qui résume les modules suivis, les cours réussis, l'accès au catalogue de formation
    *	le mentor qui présente les groupes accompagnés
    *	l'administrateur qui centralise des informations et chiffres en lien avec les apprenants, les chiffres de participation par modules


# Environnement Technique

* HTML version: 5
* CSS version: 3
* Javascript version: ES6+
* Ruby version: v2.7.4
* Rails version: v5.2.7
* Bootstrap version: 5+
* PostgreSQL version: 14.2
* Gems installées :
  * Bootsrap
  * Devise
  * Faker
  * Stripe
  * Database Cleaner
  * Better Errors
  * Dotenv-rails

### How to

1. Initialize your local environment
  * Create a dedicated directory on your local machine: `mkdir <my_directory>`
  * Change to this newly created directory: `cd <my_directory>`
  * Repatriate the Rails app content at home: `git clone <repository SSH address> .`

2. Instantiate and load database (PostgreSQL)
  * Make sur PostgreSQL is installed and running on your local environment
  * Database creation: `rails db:create`
  * Database initialization: `rails db:migrate`
  * Database filling: `rails db:seed`

3. Access web site (on your local machine)
  * Start local web server (Puma on localhost:3000): `rails s`
  * Launch your favorite web browser on [http://localhost:3000/](http://localhost:3000/)
  * Explore, sign-up and enjoy :wink:

4. Access web site (on the web)
  * Browse [https://welearnit.herokuapp.com/](https://welearnit.herokuapp.com/)
  * Explore, sign-up and enjoy :wink:

### Credits

* Victoria FELY - ["Vix00" sur Github](https://github.com/Vix00) - [Linkedin](https://www.linkedin.com/in/victoria-fely-050587105/)
* Wilfried PAILLOT - ["WilfriedPaillot" sur Github](https://github.com/WilfriedPaillot) - [Linkedin](https://www.linkedin.com/in/wilfried-paillot/)
* Yassine ROCHD - ["YAROS31" sur Github](https://github.com/YAROS31) - [Linkedin](linkedin.com/in/yassinerochd)
* Jean-Baptiste VIDAL - ["GibbZ-78" sur Github](https://github.com/GibbZ-78) - [Linkedin](https://www.linkedin.com/in/jeanbaptistevidal/)
