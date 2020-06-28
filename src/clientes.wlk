import vendedores.*
import centrosDeDistribucion.*
import ciudades.*

class  Clientes {
	
	var property inseguro = false
	var property detallista = false
	var property humanista = false
	
	method puedeSerAtendidoPor(unVendedor) { return self.clienteInseguroLeVa(unVendedor)
		or self.clienteDetallistaLeVa(unVendedor)
		or self.clienteHumanistaLeVa(unVendedor)
	}
	
	
	method clienteInseguroLeVa(unVendedor) { return  if ( self.inseguro() )
		unVendedor.esVersatil() and unVendedor.esFirme()
		else { false }
		
	}
	
	method clienteDetallistaLeVa(unVendedor) { return if ( self.detallista() ) 
		unVendedor.certificacionesSobreProductos() >= 3
		else { false }
		
	}
	
	method clienteHumanistaLeVa(unVendedor) { return if ( self.humanista() ) 
		unVendedor.personaFisica()
		else { false }
		
	}
}
