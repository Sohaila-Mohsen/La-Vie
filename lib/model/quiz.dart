import 'dart:math';

class Quiz {
  Map<String, List<Map<String, int>>>? quiz;

  Quiz() {
    quiz = {
      "Which of these is flowering plant?": [
        {"Fir tree": 0},
        {"Seaweed": 0},
        {"Oak tree": 1},
        {"Moss": 0}
      ],
      "What is a deciduous plant?": [
        {"Aplant that keeps its leaves all year round": 0},
        {"A plant that bears fruit": 0},
        {"Aplant that bears cones all year round": 0},
        {"A plant that loss its leaves each year": 1}
      ],
      "Which of this is nonflowering plant": [
        {"Eryngo": 0},
        {"Fern": 1},
        {"Oak tree": 0},
        {"Dandelion": 0}
      ],
      "What are the male parts of a flower called?": [
        {"Carpels": 0},
        {"Pollen": 0},
        {"Stigma": 0},
        {"Stamens": 1}
      ],
      "How doesaplant get water from the soil?": [
        {"Leaves": 0},
        {"Root": 1},
        {"Flower": 0},
        {"Stem": 0}
      ],
      "What is annual plant?": [
        {"Lives more than 2 years": 0},
        {"Germinates,flowers,seeds,and dies every two years": 0},
        {"Loses its leaves in winter": 0},
        {"Germinates,flowers,seeds,and dies in a year": 1}
      ],
      "What are leaves for?": [
        {"To make the plant looks pretty": 0},
        {"To soak up the sun's energy and convert it into food": 1},
        {"To protect plants from rain": 0},
        {"To protect plant from insects and other animals": 0}
      ],
      "What is chocolate made from?": [
        {"Cocoa beans": 1},
        {"Coffe beans": 0},
        {"Chicory": 0},
        {"Durum wheat": 0}
      ],
      "How can you tell the age of most trees": [
        {"By tree height": 0},
        {"By tree width": 0},
        {"The count of its leaves": 0},
        {"The count of rings in trunk": 1}
      ],
      "Which of these plants spread their seeds on water?": [
        {"Pine tree": 0},
        {"Roses": 0},
        {"Dandelion": 0},
        {"Water Lilies": 1}
      ],
    };
  }

  List<Map<String, int>> getPossibleAnswers(String question) {
    return quiz![question]!;
  }

  String randomQuestion(Map<String, List<String>> map) =>
      map.keys.elementAt(new Random().nextInt(map.length));
}
