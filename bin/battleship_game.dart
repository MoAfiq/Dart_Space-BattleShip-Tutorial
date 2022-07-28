/*
  Spaceship Battle Game
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
    print("${name} is attacked by damage of ${enemyPower}");
    print("Damage is taken");
    print("Current Health: ${health}");

    isDestroyed();
  }

  @override
  void isDestroyed() {
    if(health! <= 0) {
      print("\n\nThe armored ship, ${name} is detroyed");
      print("The high speed ship, ${name}")
    } else {
      print("The armored ship remaining health: ${health}\n\n");
    }
  }

//Calculate the actual hit
// int armoredHealth = 200;
// int currentHealth = armoredHealth + actualArmorShield - randomFirePower;
// int health = health - randomFirePower + actualArmorShield;

//Randomly absorbs hit
// int determineArmor(int actualArmorShield) {
//   Random armorShield = new Random();
//   int actualArmorShield = armorShield.nextInt(40) + 0;
//   return actualArmorShield;
// }
}

class HighSpeedSpaceShip extends Spaceship {
  var health;
  var name;
  var firePower;

  HighSpeedSpaceShip({required this.name, required this.health, required this.firePower}) : super("name", health, firePower);

  //Whether dodges hit or not
  // bool dodging;
  @override
  void hit(double enemyPower) {
    Random random = new Random();
    bool dodging = random.nextBool();

    if (dodging == true) {
      health = health - enemyPower;
      print("${name} is attacked by damage of ${enemyPower}");
      print("Current Health: ${health}");
    }
    isDestroyed();
  }

  @override
  void isDestroyed() {}
  if (health)
}

class BattleField {
  void startBattle(Spaceship sp1, Spaceship sp2) {
    //Randomly a space ship is selected to hit first. Space hit the target. Until one of them is destroyed


    //Decide who hit first
    void whoHitFirst(bool hitting) {
      Random random = new Random();
      bool hitting = random.nextBool();
      //
    }

  }
}

main() {
  print("Bettleship Game");
  Random random = new Random();
  bool ball = random.nextBool();
  print(ball);

}








// int headOrTail = random.nextInt(2);
//   if (headOrTail == 2) {
//     print("Head");
//     bool dodging = true;
// } else {
//     print("Tail");
//     bool dodging = false;
// }