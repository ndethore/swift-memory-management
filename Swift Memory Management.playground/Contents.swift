//: # Write memory efficient Swift code.
//: Playground - noun: a place where people can play

/*
** Pilot
*/

class Implent {
	unowned let pilot: Pilot
	
	init(pilot: Pilot) {
		self.pilot = pilot
		print("Implent created.");
	}
	
	deinit { print("Implent detroyed.") }
	
}


class Pilot {
	
	var implent: Implent?
	weak var spaceship: Spaceship?
	
	init() { print("Pilot created.") }
	
	deinit { print("Pilot destroyed.") }
	
}



/*
** Spaceship
*/

class Beacon {
	unowned let spaceship: Spaceship
	
	init(spaceship: Spaceship) {
		self.spaceship = spaceship
		print("Beacon created.")
	}
	
	deinit { print("Beacon destroyed.") }
	
}

class Spaceship {
	var beacon: Beacon!
	weak var pilot: Pilot?
	var op: StationOperator?
	lazy var dockingProcedure: Void -> Void = {
		[unowned self, weak weakOperator = self.op!] in
		
		weakOperator?.didEngageDockingProcedure(self)
		//do stuff...
		weakOperator?.didFinishDockingProcedure(self)
	}
	
	init(registrationIdentifier:String) {
		print("Spaceship created.")
		self.beacon = Beacon(spaceship: self)
	}
	
	deinit { print("Spaceship destroyed.") }
	
}

class StationOperator {
	func didEngageDockingProcedure(spaceship: Spaceship) { }
	func didFinishDockingProcedure(spaceship: Spaceship) { }
}






var ship: Spaceship? = Spaceship(registrationIdentifier: "XA24Y-55")
var pilot: Pilot? = Pilot()

pilot!.implent =  Implent(pilot: pilot!)
pilot!.spaceship = ship
ship!.pilot = pilot


pilot = nil
ship = nil

