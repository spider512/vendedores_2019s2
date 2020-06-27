import vendedores.*
import ciudades.*
import clientes.*

class CentroDeDistribucion {
	
	var property vendedores = {}
	var property ciudad
	
	method agregarVendedor(unVendedor) { if (vendedores.contains(unVendedor))  self.error("el vendedor ya es del equipo")
		else vendedores.add(unVendedor)
	}
	
	method vendedorEstrella() { return vendedores.max( {vend => vend.certificaciones().puntaje() }) 
		
	}
	
	method puedeCubrir(unaCiudad) {
		return vendedores.any( { vend => vend.puedeTrabajarEnCiudad(unaCiudad) } )
	}
	
	method vendedoresGenericos() { return vendedores.filter( { vend => vend.esGenerico() } ) 
		
	}
	
	method esRobusto() { return vendedores.filter( { vend => vend.esFirme() } ).size() >= 3 
		
	}
	
	method repartirCertificacion(unaCertificacion) {
		vendedores.forEach( { vend => vend.agregarCertificacion(unaCertificacion) } )
	}
	
	method esCandidato(unVendedor) { return unVendedor.esVersatil() and 
		unVendedor.tieneAfinidad(self)
	}
	
}


class Certificaciones {
	
	var property puntos
	var property esSobreProductos = false
}
