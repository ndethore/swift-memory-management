//: Playground - noun: a place where people can play

// Pilot

class License {
	let identifier: String
	unowned let pilot: Pilot // A license is issued for a specific pilot. Must be destroyed along with the pilot.
//	let pilot: Pilot
	
	init(identifier: String, pilot: Pilot) {
		self.identifier = identifier
		self.pilot = pilot
		
		print("License #\(self.identifier) created.");
	}
	
	deinit { print("License #\(identifier) detroyed.") }
	
}


class Pilot {
	let name: String
	var license: License? // A pilot don't necessarily have a license (yet).
	weak var spaceship: Spaceship? // A pilot don't necessarilty have an spaceship.
//	var spaceship: Spaceship?
	
	init(name: String) {
		self.name = name
		
		print("Pilot named \(self.name) created.")
	}
	
	deinit { print("Pilot named \(self.name) destroyed.") }
	
}


// Spaceship

class RegistrationPlate {
	let indentifier: String
	unowned let spaceship: Spaceship // A registration plate is issued for a specific vehicle. Must be destroyed along with the associated vehicle.
//	let spaceship: Spaceship
	
	init(identifier: String, spaceship: Spaceship) {
		self.indentifier = identifier
		self.spaceship = spaceship
		
		print("Registration plate #\(self.indentifier) created.")
	}
	
	deinit { print("Registration plate #\(self.indentifier) destroyed.") }
	
}


class Spaceship {
	let model: String
	var plate: RegistrationPlate! // A spacship must have a registration plate.
	weak var pilot: Pilot? // A do not necessarily have a pilot.
//	var pilot: Pilot?
	
	init(model: String, registrationIdentifier:String) {
		self.model = model
		
		print("Spaceship #\(self.model) created.")
		
		self.plate = RegistrationPlate(identifier: registrationIdentifier, spaceship: self)
	}
	
	deinit { print("Spaceship #\(self.model) destroyed.") }
	
}


var ship: Spaceship? = Spaceship(model: "Galatic Razor", registrationIdentifier: "XA24Y-55")
var pilot: Pilot? = Pilot(name: "Skywalker")

pilot!.license =  License(identifier: "HTY4S5", pilot: pilot!)
pilot!.spaceship = ship
ship!.pilot = pilot

pilot = nil
ship = nil



