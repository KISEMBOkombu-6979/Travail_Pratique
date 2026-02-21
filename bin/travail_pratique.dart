import 'dart:io';

void main() {
  print("1. Arabe vers Romain");
  print("2. Romain vers arabe");
  stdout.write("Choisissez une option (1 ou 2): ");
  String? choix = stdin.readLineSync();

  if (choix == "1") {
    stdout.write("Entrez un nombre arabe (1 - 3999): ");
    int nombre = int.parse(stdin.readLineSync()!);
    print("Chiffre romain: ${arabeVersRomain(nombre)}");
  } else if (choix == "2") {
    stdout.write("Entrez un chiffre romain: ");
    String romain = stdin.readLineSync()!;
    print("Nombre: ${romainVersArabe(romain)}");
  } else {
    print("Option invalide.");
  }
}

String arabeVersRomain(int nombre) {
  List<int> valeurs = [
    1000, 900, 500, 400,
    100, 90, 50, 40,
    10, 9, 5, 4, 1
  ];

  List<String> symboles = [
    "M", "CM", "D", "CD",
    "C", "XC", "L", "XL",
    "X", "IX", "V", "IV", "I"
  ];

  String resultat = "";

  for (int i = 0; i < valeurs.length; i++) {
    while (nombre >= valeurs[i]) {
      resultat += symboles[i];
      nombre -= valeurs[i];
    }
  }

  return resultat;
}

int romainVersArabe(String romain) {
  Map<String, int> valeurs = {
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
  };

  int total = 0;
  int prev = 0;

  for (int i = romain.length - 1; i >= 0; i--) {
    int current = valeurs[romain[i]]!;

    if (current < prev) {
      total -= current;
    } else {
      total += current;
    }

    prev = current;
  }

  return total;
}


