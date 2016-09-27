# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Service.destroy_all
services_attributes = [
  {
    name: "Carte UGC illimité",
    company: "UGC Ciné Cité",
    street_address: "Service Abonnés",
    zip_code: 92206,
    city: "Neuilly sur Seine Cedex",
    postal_box: "TSA 30 200",
    form_specs: "https://juliendasilva.typeform.com/to/QyqJ49?",
    text_base: {
      "object": "Objet: Résiliation de la carte cinéma, référence client N°",
      "hello_sentence": "Madame, Monsieur,",
      "motivation": {
        "end_of_commitment": {
          "line_1": "Je vous informe aujourd'hui par cette lettre envoyée en recommandé, que je souhaite mettre fin à mon abonnement souscrit auprès de votre établissement, sous le numéro d'abonné inscrit en haut de ce courrier.",
          "line_2": "Ma période d'engagement étant achevée, je ne souhaite pas renouveler mon abonnement à votre salle de cinéma. Je vous annonce donc ma décision de résilier mon abonnement, et vous prie de prendre les mesures adéquates pour mettre fin au contrat qui nous lie.",
          "line_3": "Je vous remercie de prendre en compte ma demande dès réception de ce courrier recommandé, et de m'envoyer en retour un courrier me confirmant le terme de mon contrat.",
        },
        "moving": {
          "line_1": "Je vous informe aujourd'hui par cette lettre envoyée en recommandé, que je souhaite mettre fin à mon abonnement souscrit auprès de votre établissement, sous le numéro d'abonné inscrit en haut de ce courrier, suite à mon déménagement",
          "line_2": "Les conditions générales de vente de mon contrat me permettent de résilier mon abonnement, suite à mon déménagement dans une zone où votre réseau de salles de cinéma n'est pas présent. J'invoque donc mon droit à résilier sans frais. Vous trouverez ci-joint à ce courrier, un document justifiant la localisation de mon nouveau domicile.",
          "line_3": "Je vous remercie de prendre en compte ma demande dès réception de ce courrier recommandé, et de me rembourser les sommes trop perçues correspondant aux mois pendant lesquels je ne pourrais pas profiter de mon abonnement.",
        },
        "theater_closing": {
          "line_1": "Je vous informe aujourd'hui par cette lettre envoyée en recommandé, que je souhaite mettre fin à mon abonnement souscrit auprès de votre société, sous le numéro d'abonné inscrit en haut de ce courrier, suite à la fermeture du cinéma situé près de mon domicile",
          "line_2": "Les conditions générales de vente de mon contrat me permettent de résilier mon abonnement dans la mesure où le cinéma situé près de chez moi a fermé ou est sorti du système d'abonnement de votre réseau. Ne pouvant donc plus utiliser ma carte de cinéma, j'invoque mon droit à résilier sans frais mon contrat.",
          "line_3": "Je vous remercie de prendre en compte ma demande dès réception de ce courrier recommandé, et de me rembourser les sommes trop perçues, correspondant aux mois pendant lesquels je n'ai pas pu profiter de mon abonnement.",
        },
        "price_changing": {
          "line_1": "Je vous informe aujourd'hui par cette lettre envoyée en recommandé, que je souhaite mettre fin à mon abonnement cinéma souscrit auprès de votre établissement, sous le numéro d'abonné inscrit en haut de ce courrier, suite à une récente modification des conditions contractuelles.",
          "line_2": "Comme le prévoit l'article L121-110 du Code de la consommation, 'tout projet de modification des conditions contractuelles à l'initiative du professionnel est communiqué par écrit par ce professionnel au consommateur au moins un mois avant son entrée en vigueur, assorti de l'information, énoncée de manière claire, précise et visible, selon laquelle ce dernier peut, tant qu'il n'a pas expressément accepté les nouvelles conditions, résilier le contrat, sans pénalité de résiliation et sans droit à dédommagement, jusque dans un délai de trois mois après l'entrée en vigueur de la modification.'",
          "line_3": "Ainsi, j'invoque mon droit à résilier mon contrat, sans que je sois soumis à de quelconques pénalités.",
          "line_4": "Je vous remercie de prendre en compte ma demande dès réception de ce courrier recommandé, et de m'envoyer en retour un courrier me confirmant la date de fin de mon abonnement.",
        }
      },
      "client_deletion": "Je vous prie de supprimer de vos fichiers toute information relative à mes coordonnées postales et bancaires. Je m'oppose en particulier à toute utilisation, ou mise à disposition à des organismes extérieurs, de mes coordonnées personnelles à des fins commerciales.",
      "politeness_sentence": "Veuillez accepter Madame, Monsieur, l' expression de mes salutations distinguées.",
    }

  }
]
services_attributes.each { |params| Service.create!(params) }
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
