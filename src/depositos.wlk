class DepositoFerroviario {
	const formaciones = []
	const locomotoras = []
	
	
	method vagonesMasPesados() {
		return
		formaciones.map({f => f.vagonMasPesadO()}).asSet()
	}
	
	method nesesitaConductorExperimentado() {
		return formaciones.any({f => f.esCompleja()})
	}
}
