import centrosDeDistribucion.*
import ciudades.*
import clientes.*

class Vendedor {
	// Vendedores reclutados por Lopez&Lopez
	var property certificaciones = []
	var property personaFisica = true
	
	method agregarCertificacion(unaCertificacion) { certificaciones.add(unaCertificacion) 
		
	}
	
	method esFirme() { return certificaciones.map( { cert => cert.puntos() } ).sum() > 30
		
	}
	
	method esVersatil() { return certificaciones.size() > 2 and self.multiCertificado()
		
	}
	
	method esGenerico() { return certificaciones.any( { cert => not cert.esSobreProductos() } )
		
	}
	
	method certificacionesSobreProductos() { return certificaciones.filter( { cert => cert.esSobreProductos() }).size()
		
	}
	

	method multiCertificado() { return certificaciones.any( {cert => cert.esSobreProductos()} )
		and not certificaciones.any( {cert => cert.esSobreProductos()} )
	}
	
	
	


}
class Vfijo inherits Vendedor {
	
	var property ciudad
	
	method ciudad(unaCiudad) { ciudad = unaCiudad }
	
	method puedeTrabajarEnCiudad(unaCiudad) { return ciudad == unaCiudad 
		
	}
	
	method esInfluyente() { return false 
		
	}
	
	method tieneAfinidad(unCentro) { return self.puedeTrabajarEnCiudad( unCentro.ciudad() ) 
		
	}
	
}

class VViajante inherits Vendedor {
	
	var property provinciasHabilitadas = []
	
	method agregarProvincia(unaProvincia) { provinciasHabilitadas.add(unaProvincia) }
	
	method puedeTrabajarEnCiudad(unaCiudad) { 
		return provinciasHabilitadas.any( { prov => prov.ciudades().contains(unaCiudad) } ) 
	}
	
	method esInfluyente() { 
		return provinciasHabilitadas.map( {prov => prov.poblacion()} ).sum() >= 10000000
	}
	
	method tieneAfinidad(unCentro) { return self.puedeTrabajarEnCiudad( unCentro.ciudad() ) 
		
	}
	
	
}

class VComercioCorresponsal inherits Vendedor {
	
	var property ciudadesConSucursales = {}
	
	method puedeTrabajarEnCiudad(unaCiudad) { 
		return ciudadesConSucursales.contains(unaCiudad)
	}
	
	method esInfluyente() { 
		return ciudadesConSucursales.size() >= 5 or
		 ciudadesConSucursales.map( { ciud => ciud.provincia() } ).size() >= 3
	}
	
	method tieneAfinidad(unCentro) { return self.puedeTrabajarEnCiudad( unCentro.ciudad() ) and
		ciudadesConSucursales.any( { ciud => not unCentro.puedeCubrir(ciud) } )
	}
	
		override method personaFisica() { return false
			
	}
}

