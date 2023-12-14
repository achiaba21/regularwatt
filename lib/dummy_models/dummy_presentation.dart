import 'package:regular_watt/model/presentation.dart';

List<Presentation> presentations = [
  const Presentation(
      titre: "Mesurez avec précision votre consommation d'énergie",
      text:
          "La fonction «Mesure» vous informe sur votre consommation d'énergie, que vous la saisissiez manuellement ou via un capteur.",
      img: "assets/intro/time_mesurer.jpg"),
  const Presentation(
      titre: "Estimez votre consommation d'énergie",
      text:
          "La fonction \"Estimation\" prédit votre facture énergétique future pour des ajustements éventuels.",
      img: "assets/intro/estimer_conso.jpg"),
  const Presentation(
    titre: "Suivez en temps réel votre consommation d'énergie",
    text:
        "Eh Oui, c'est faisable avec le cadran de puissance instantanée. Vous pouvez :\n\nGérer les limites de puissance de vos installations.Trouver les appareils énergivores et optimiser leur utilisation et Réduire le gaspillage.",
    img: "assets/intro/temps_reel.jpg",
  ),
  const Presentation(
    titre: "Personnalisez vos alertes budgétaire",
    text:
        """Entrez votre budget et obtenez des détails sur vos objectifs de consommation, y compris une simulation budgétaire pour la consommation.""",
    img: "assets/intro/alertes.jpg",
  )
];
