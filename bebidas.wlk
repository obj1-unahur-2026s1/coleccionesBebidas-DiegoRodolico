object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

object licuadoFrutas {
  const nutrientes = []
  method agregarElemento(unElemento) {
    nutrientes.add(unElemento)
  }
  method rendimientoQueOtorga(dosisConsumida) = (dosisConsumida / 1000) * nutrientes.sum()  
}
object aguaSabrizada {
  var bebidaActual = whisky
  method cambiarBebida(nuevaBebida) {
    bebidaActual = nuevaBebida
  }
  method rendimientoQueOtorga(dosisConsumida){
    var agua = dosisConsumida * 0.75
    var bebidaUsada = dosisConsumida * 0.25

    return 1 + bebidaActual.rendimientoQueOtorga(bebidaUsada)
  }
}

object coctel {
  const bebidas = []
  method rendimientoQueOtorga(dosisConsumida){
  var dosisPorBebida = dosisConsumida/bebidas.size()
  return bebidas.fold(1, { acumulador, bebida => acumulador * bebida.rendimientoQueOtorga(dosisPorBebida) })
  }  
}

