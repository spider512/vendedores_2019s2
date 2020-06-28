import centrosDeDistribucion.*
import vendedores.*
import clientes.*

class Ciudad {

	var property provincia

	method provincia(unaProvincia) {
		provincia = unaProvincia
	}

}

class Provincia {

	var property poblacion = 0
	var property ciudades = []

	method agregarCiudad(unaCiudad) {
		ciudades.add(unaCiudad)
	}

}

