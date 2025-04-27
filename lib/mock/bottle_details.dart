import 'package:whisky_app/models/bottle_model.dart';
import 'package:whisky_app/models/history_model.dart';
import 'package:whisky_app/models/tasting_model.dart';

final List<BottleModel> mockBottleDetails = [
  BottleModel(
    id: 1,
    distillery: "Springbank",
    region: "Campbeltown",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "25 Years",
    filled: "1995",
    bottled: "2020",
    caskNumber: "1234",
    abv: "53.5%",
    cask: "Ex-Bourbon Barrel",
    finish: "Sherry Cask Finish",
    imageUrl: "assets/images/springbank_1995.png",
    available: 112,
    total: 158,
    history: History(
      label: "Limited Edition Release",
      title: "Celebrating 200 Years",
      heading: "Legacy of Springbank",
      description:
          "This special edition celebrates two centuries of whisky making with a complex, elegant profile matured in bourbon barrels and finished in sherry wood.",
    ),
    tastingNotes: [
      TastingNote(
          userNote:
              "Rich, oily mouthfeel with notes of dried fruits and spices."),
      TastingNote(userNote: "A beautiful balance of sweetness and smokiness.")
    ],
  ),
  BottleModel(
    id: 2,
    distillery: "Macallan",
    region: "Speyside",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "18 Years",
    filled: "2002",
    bottled: "2020",
    caskNumber: "5678",
    abv: "43%",
    cask: "Sherry Oak Casks",
    finish: "Natural",
    imageUrl: "assets/images/macallan_18.png",
    available: 85,
    total: 100,
    history: History(
      label: "The Sherry Legacy",
      title: "Oak's Embrace",
      heading: "Taste of Tradition",
      description:
          "Matured exclusively in sherry-seasoned oak, this iconic whisky is known for intense dried fruits, spice, and hints of orange chocolate.",
    ),
    tastingNotes: [
      TastingNote(
        userNote: "Deep raisin notes and a beautiful nutty finish.",
      )
    ],
  ),
  BottleModel(
    id: 3,
    distillery: "Lagavulin",
    region: "Islay",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "16 Years",
    filled: "2004",
    bottled: "2020",
    caskNumber: "7890",
    abv: "43%",
    cask: "Refill American Oak",
    finish: "Natural",
    imageUrl: "assets/images/lagavulin_16.png",
    available: 74,
    total: 120,
    history: History(
      label: "Peat Legend",
      title: "Essence of Islay",
      heading: "Smoky Richness",
      description:
          "Powerful peat smoke with iodine and seaweed, a classic among Islay lovers.",
    ),
    tastingNotes: [
      TastingNote(
        userNote: "Salty, smoky, heavy yet smooth — a true classic.",
      )
    ],
  ),
  BottleModel(
    id: 4,
    distillery: "Ardbeg",
    region: "Islay",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "Uigeadail",
    filled: "2005",
    bottled: "2020",
    caskNumber: "1357",
    abv: "54.2%",
    cask: "Ex-Bourbon and Sherry Casks",
    finish: "Natural",
    imageUrl: "assets/images/ardbeg_uigeadail.png",
    available: 90,
    total: 130,
    history: History(
      label: "Islay's Peatiest",
      title: "The Ultimate Peat Experience",
      heading: "Complexity in a Glass",
      description:
          "A marriage of ex-bourbon and sherry casks, this whisky is rich, smoky, and full-bodied.",
    ),
    tastingNotes: [
      TastingNote(
        userNote:
            "Intense smoke, dark chocolate, and a long, warming finish. A must-try!",
      )
    ],
  ),
  BottleModel(
    id: 5,
    distillery: "GlenDronach",
    region: "Highlands",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "21 Years",
    filled: "1999",
    bottled: "2020",
    caskNumber: "2468",
    abv: "48%",
    cask: "Spanish Oak Sherry Casks",
    finish: "Natural",
    imageUrl: "assets/images/glendronach_21.png",
    available: 67,
    total: 90,
    history: History(
      label: "Sherry Cask Mastery",
      title: "The Parliament Experience",
      heading: "Rich and Opulent",
      description:
          "Aged in the finest Spanish oak sherry casks, this whisky is rich, dark, and full of dried fruits.",
    ),
    tastingNotes: [
      TastingNote(
          userNote:
              "Rich sherry notes with dark chocolate and a hint of spice. A true delight.")
    ],
  ),
  BottleModel(
    id: 6,
    distillery: "Laphroaig",
    region: "Islay",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "10 Years",
    filled: "2010",
    bottled: "2020",
    caskNumber: "2468",
    abv: "57.8%",
    cask: "Ex-Bourbon Casks",
    finish: "Natural",
    imageUrl: "assets/images/laphroaig_10.png",
    available: 55,
    total: 75,
    history: History(
      label: "Islay's Iconic Peat",
      title: "The Original Islay Single Malt",
      heading: "Bold and Smoky",
      description:
          "A classic Islay whisky with a rich, peaty character and a hint of sweetness.",
    ),
    tastingNotes: [
      TastingNote(
        userNote:
            "Intense peat smoke, medicinal notes, and a long, warming finish. A classic.",
      )
    ],
  ),
  BottleModel(
    id: 7,
    distillery: "Balvenie",
    region: "Speyside",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "21 Years",
    filled: "1998",
    bottled: "2020",
    caskNumber: "1357",
    abv: "47.5%",
    cask: "Rum Casks",
    finish: "Natural",
    imageUrl: "assets/images/balvenie_21.png",
    available: 80,
    total: 95,
    history: History(
      label: "Rum Cask Finish",
      title: "The PortWood Experience",
      heading: "Sweet and Spicy",
      description:
          "Aged in rum casks, this whisky is rich, sweet, and full of tropical fruit notes.",
    ),
    tastingNotes: [
      TastingNote(
          userNote:
              "Tropical fruits, honey sweetness, and a hint of spice. A unique experience.")
    ],
  ),
  BottleModel(
    id: 8,
    distillery: "Highland Park",
    region: "Orkney",
    country: "Scotland",
    type: "Single Malt",
    ageStatement: "18 Years",
    filled: "2002",
    bottled: "2020",
    caskNumber: "1357",
    abv: "43%",
    cask: "Ex-Bourbon and Sherry Casks",
    finish: "Natural",
    imageUrl: "assets/images/highland_park_18.png",
    available: 100,
    total: 110,
    history: History(
      label: "Orkney Legend",
      title: "The Viking Heritage",
      heading: "Balanced and Complex",
      description:
          "Aged in a mix of ex-bourbon and sherry casks, this whisky is rich, smoky, and full of dried fruits.",
    ),
    tastingNotes: [
      TastingNote(
        userNote: "Rich and complex with a hint of smoke and dried fruits.",
      )
    ],
  ),
];
