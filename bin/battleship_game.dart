/*
  Spaceship Battle Game
  Afiq Salleh
*/
import 'dart:math';

abstract class Spaceship {
  String name;
  double health;
  double firePower;

  Spaceship(this.name, this.health, this.firePower);

  void isDestroyed() {}
  void hit(double enemyPower) {}
}

class ArmoredSpaceShip extends Spaceship {
  var health;
  var name;
  var firePower;

  ArmoredSpaceShip({required this.name, required this.health, required this.firePower}) : super("name", health, firePower);
  @override
  void hit(double enemyPower) {
    Random randomPercentage = new Random();
    int armorShield = randomPercentage.nextInt(40);
    health = health  + armorShield - enemyPower;
    print("${name} is attacked.");
    print("Damage taken: ${enemyPower - armorShield}");
    print("$name Current Health: ${health}");

    isDestroyed();
  }

  @override
  void isDestroyed() {
    if(health <= 0) {
      print("\nThe armored ship, $name is detroyed and lost.");
      print("The high speed spaceship won!!!");
    } else {
      print("\n");
    }
  }
}

class HighSpeedSpaceShip extends Spaceship {
  var health;
  var name;
  var firePower;

  HighSpeedSpaceShip(
      {required this.name, required this.health, required this.firePower})
      : super("name", health, firePower);

  //Whether dodges hit or not
  // bool dodging;
  @override
  void hit(double enemyPower) {
    bool dodging = Random().nextBool();

    if (dodging == true) {
      health = health - enemyPower;
      print("$name is attacked.");
      print("Damage taken: $enemyPower");
      print("$name Current Health: $health");
    }
    isDestroyed();
  }

  @override
  void isDestroyed() {
    if (health <= 0) {
      print("\nThe high speed ship, ${name} is detroyed and lost.");
      print("The armored spaceship won!!!");
    } else {
      print("\n");
    }
  }
}

class BattleField {
  void startBattle(Spaceship sp1, Spaceship sp2) async {
    //Randomly a space ship is selected to hit first. Space hit the target. Until one of them is destroyed

    while (sp1.health > 0 && sp2.health > 0) {
      await Future.delayed(Duration(seconds: 2), () {
        Random random = new Random();
        bool whoStartFirst = random.nextBool();
        //Decide who hit first
        if (whoStartFirst == true) {
          sp1.hit(sp2.firePower);
        } else {
          sp2.hit(sp1.firePower);
        }
      });
    }
  }
}


//Main Body
void main() {
  print("Bettleship Game");
  ArmoredSpaceShip ship1 = ArmoredSpaceShip(name: "Gamuda", health: 1000.0, firePower: 50.0);
  HighSpeedSpaceShip ship2 = HighSpeedSpaceShip(name: "HMS Malaya", health: 200.0, firePower: 250.0);

  BattleField().startBattle(ship1, ship2);

}








// int headOrTail = random.nextInt(2);
//   if (headOrTail == 2) {
//     print("Head");
//     bool dodging = true;
// } else {
//     print("Tail");
//     bool dodging = false;
// }