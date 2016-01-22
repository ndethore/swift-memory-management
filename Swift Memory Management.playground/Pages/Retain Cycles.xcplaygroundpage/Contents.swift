//: # Write memory efficient Swift code.
//: Playground - noun: a place where people can play

/*
** Pilot
*/

class LicenseImplent {
	let identifier: String
	unowned let pilot: Pilot
	
	init(identifier: String, pilot: Pilot) {
		self.identifier = identifier
		self.pilot = pilot
		print("Implent #\(self.identifier) created.");
	}
	
	deinit { print("Implent #\(identifier) detroyed.") }
	
}


class Pilot {
	let name: String
	var implent: LicenseImplent?
	weak var spaceship: Spaceship?
	
	init(name: String) {
		self.name = name
		print("Pilot named \(self.name) created.")
	}
	
	deinit { print("Pilot named \(self.name) destroyed.") }
	
}



/*
** Spaceship
*/

class RegistrationBeacon {
	let identifier: String
	unowned let spaceship: Spaceship
	
	init(identifier: String, spaceship: Spaceship) {
		self.identifier = identifier
		self.spaceship = spaceship
		print("Beacon #\(self.identifier) created.")
	}
	
	deinit { print("Beacon #\(self.identifier) destroyed.") }
	
}

class Spaceship {
	let model: String
	var beacon: RegistrationBeacon!
	weak var pilot: Pilot?
	var op: StationOperator?
	lazy var dockingProcedure: Void -> Void = {
		[unowned self, weak weakOperator = self.op] in
		
		weakOperator?.didEngageDockingProcedure(self)
		//do stuff...
		weakOperator?.didFinishDockingProcedure(self)
	}
	
	init(model: String, registrationIdentifier:String) {
		self.model = model
		print("Spaceship #\(self.model) created.")
		self.beacon = RegistrationBeacon(identifier: registrationIdentifier, spaceship: self)
	}
	
	deinit { print("Spaceship #\(self.model) destroyed.") }
	
}

class StationOperator {
	func didEngageDockingProcedure(spaceship: Spaceship) { }
	func didFinishDockingProcedure(spaceship: Spaceship) { }
}






var ship: Spaceship? = Spaceship(model: "XWing", registrationIdentifier: "XA24Y-55")
var pilot: Pilot? = Pilot(name: "Skywalker")

pilot!.implent =  LicenseImplent(identifier: "HTY4S5", pilot: pilot!)
pilot!.spaceship = ship
ship!.pilot = pilot


pilot = nil
ship = nil



