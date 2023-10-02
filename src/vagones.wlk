class Pasajero {
	const property largo
	const property ancho
	const property tieneBanios
	var property estaOrdenado
	
	method cantidadDePasajeros() {
		const pasajeros = largo * if(ancho <= 3) 8 else 10
		
		return
		if(not estaOrdenado) 0.max(pasajeros - 15)  else pasajeros
	}
	
	method cargaMaxima() = if(tieneBanios) 300 else 800
	method pesoMaximo() = 2000 + 80 * self.cantidadDePasajeros() + self.cargaMaxima()
	method esPopular() = self.cantidadDePasajeros() > 50
	method recibirMantenimiento() {
		estaOrdenado = true
	}
	method puedeTransportar(unValor) = self.cargaMaxima() >= unValor
	method esDePasajeros() = self.cantidadDePasajeros() > 0
}

class Carga {
	const property cargaMaximaIdeal
	var property maderasSueltas
	
	method cantidadDePasajeros() = 0
	method cargaMaxima() = 0.max(cargaMaximaIdeal - 400 * maderasSueltas)
	method pesoMaximo() = 1500 + self.cargaMaxima() 
	method tieneBanios() = false
	method esPopular() =  self.cantidadDePasajeros() > 50
	method recibirMantenimiento() {
		maderasSueltas = 0.max(maderasSueltas - 2)
	}
	method puedeTransportar(unValor) = self.cargaMaxima() >= unValor 
	method esDePasajeros() = self.cantidadDePasajeros() > 0
	
}

class Dormitorio {
	const property cantidadCompartimientos
	var property camasPorCompartimiento
	method cantidadDePasajeros() = cantidadCompartimientos * camasPorCompartimiento
	method pesoMaximo() = 4000 + 80 * self. cantidadDePasajeros() + self.cargaMaxima()
	method cargaMaxima() = 1200
	method tieneBanios() = true
	method esPopular() = self.cantidadDePasajeros() > 50
	method recibirMantenimiento() {}
	method puedeTransportar(unValor) = self.cargaMaxima() >= unValor
	method esDePasajeros() = self.cantidadDePasajeros() > 0
}