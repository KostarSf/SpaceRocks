if (!successfully_use || other.faction == parent_ship.faction) exit;

other.take_damage(power(parent_ship.speed, 4) * 0.05);