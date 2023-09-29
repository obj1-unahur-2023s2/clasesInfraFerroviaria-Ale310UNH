import vagones.*
import locomotoras.*

class Formacion {
	const vagones = new List()
	const locomotoras = new List()
	
	method agregarVagon(unVagon) {
		vagones.add(unVagon)
	}
	
	method desarmarFormacion() {
		vagones.clear()
	}
	
	method agregaLocomotora(unaLocomotora) {
		locomotoras.add(unaLocomotora)
	}
	
	method cuantosPasajerosPuedeLLevar() {
		return vagones.sum {vagon => vagon.cantidadDePasajeros()}
	}
	
	method cantidadVagonesPopulares() {
		return vagones.count { vagon => vagon.esPopular()}
	}
	
	method realizarMantenimientoVagones() {
		vagones.forEach { vagon => vagon.recibirMantenimiento()}
	}
	
	method esFormacionCarguera() {
		return vagones.all  { vagon => vagon.puedeTransportar(1000)}
	}
	
	method dispersionDePesos() {
		const maximo = vagones.max { vagon => vagon.pesoMaximo() }
		const minimo = vagones.min { vagon => vagon.pesoMaximo() }
		return maximo.pesoMaximo() - minimo.pesoMaximo()
	}
	
	method cantidDeBanios() {
		return vagones.count { vagon => vagon.tieneBanios()}
	}
	
	method estaEquilibrada() {
		const pasajeros = self.vagonesSoloDePasajeros() 
		const maximo = pasajeros.max {vagon => vagon.cantidadDePasajeros() }
		const minimo = pasajeros.min {vagon => vagon.cantidadDePasajeros() }
		return maximo.cantidadDePasajeros() - minimo.cantidadDePasajeros() <= 20
	}
	
	method vagonesSoloDePasajeros() {
		return vagones.filter { vagon => vagon.esDePasajeros()}
	}
	
	method estaOrganizada() {
		return not (1..vagones.size()-1).any {
			idx => not vagones.get(idx-1).esDePasajeros() and vagones.get(idx).esDePasajeros()
		}
	}
	
	method locomotoraMasLenta() = locomotoras.min({l => l.velocidadMaxima()})
	
	method velocidadMaxima() = self.locomotoraMasLenta().velocidadMaxima()
	
	method eseficiente() = locomotoras.all({l => l.esEficiente()})
	
	method pesoDeVagones() = vagones.sum({v => v.pesoMaximo()})
	
	method pesoDeLocomotoras() = locomotoras.sum({l => l.peso()})
	
	method sumaDePesos() = self.pesoDeVagones() + self.pesoDeLocomotoras()
	
	method sumaDelArrastre() = locomotoras.sum({l => l.arrastre()})
	
	method puedeMoverse() = self.sumaDelArrastre() >= self.sumaDePesos()
	
	method kilosDeEmpujeFaltantes() {
		return 0.max(self.sumaDePesos() - self.sumaDelArrastre())
	}
	
	method vagonMasPesado() = vagones.max({v => v.pesoMaximo()})
	
	method esCompleja() {return
		self.unidadesDeLaFormacion() > 8 or self.sumaDePesos() > 8000
	}
	
	method unidadesDeLaFormacion() = vagones.size() + locomotoras.size()
}