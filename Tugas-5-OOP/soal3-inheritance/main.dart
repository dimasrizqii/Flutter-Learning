import 'armor_titan.dart';
import 'attack_titan.dart';
import 'beast_titan.dart';
import 'human.dart';
import 'titan.dart';

void main() async {
  ArmorTitan armorTitan = ArmorTitan();
  AttackTitan attackTitan = AttackTitan();
  BeastTitan beastTitan = BeastTitan();
  Human human = Human();

  armorTitan.setPowerPoint(3);
  attackTitan.setPowerPoint(7);
  beastTitan.setPowerPoint(2);
  human.setPowerPoint(10);

  print("=== TITAN TOURNAMENT ===\n");

  print("--- Peserta Tournament ---");
  displayTitan("Armor Titan", armorTitan, armorTitan.terjang());
  displayTitan("Attack Titan", attackTitan, attackTitan.punch());
  displayTitan("Beast Titan", beastTitan, beastTitan.lempar());
  displayTitan("Human", human, human.killAllTitan());

  await Future.delayed(Duration(seconds: 2));
  print("\n=== BATTLE DIMULAI ===\n");

  await Future.delayed(Duration(seconds: 1));
  print("--- ROUND 1 ---");
  print("Armor Titan VS Attack Titan");
  var round1Winner = await battle(
    "Armor Titan",
    armorTitan,
    armorTitan.terjang(),
    "Attack Titan",
    attackTitan,
    attackTitan.punch(),
  );

  await Future.delayed(Duration(seconds: 2));
  print("\n--- ROUND 2 ---");
  print("${round1Winner['name']} VS Beast Titan");
  var round2Winner = await battle(
    round1Winner['name'],
    round1Winner['titan'],
    round1Winner['attack'],
    "Beast Titan",
    beastTitan,
    beastTitan.lempar(),
  );

  await Future.delayed(Duration(seconds: 2));
  print("\n--- FINAL ROUND ---");
  print("${round2Winner['name']} VS Human");
  var champion = await battle(
    round2Winner['name'],
    round2Winner['titan'],
    round2Winner['attack'],
    "Human",
    human,
    human.killAllTitan(),
  );

  await Future.delayed(Duration(seconds: 2));
  print("\n=== TOURNAMENT SELESAI ===");
  print("🏆 CHAMPION: ${champion['name']} 🏆");
  print("Power Point: ${champion['titan'].getPowerPoint()}");
  print("Special Attack: ${champion['attack']}");
}

void displayTitan(String name, Titan titan, String attack) {
  var power = titan.getPowerPoint();
  print("$name");
  print("  Power Point: ${power < 5 ? 5 : power}");
  print("  Special Attack: $attack");
  print("");
}

Future<Map<String, dynamic>> battle(
  String name1,
  Titan titan1,
  String attack1,
  String name2,
  Titan titan2,
  String attack2,
) async {
  print("$name1 (Power: ${titan1.getPowerPoint()}) melakukan serangan!");
  print("  $attack1");
  await Future.delayed(Duration(seconds: 1));

  print("$name2 (Power: ${titan2.getPowerPoint()}) melakukan serangan!");
  print("  $attack2");
  await Future.delayed(Duration(seconds: 1));

  if (titan1.getPowerPoint() > titan2.getPowerPoint()) {
    print("💥 $name1 MENANG!");
    return {'name': name1, 'titan': titan1, 'attack': attack1};
  } else {
    print("💥 $name2 MENANG!");
    return {'name': name2, 'titan': titan2, 'attack': attack2};
  }
}
