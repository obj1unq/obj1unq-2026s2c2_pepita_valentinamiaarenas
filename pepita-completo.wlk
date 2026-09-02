object pepita{ 
    var energia = 100
 
    method volar(distancia) { 
        energia = energia - 10 - distancia/10
    } 

    method descansar() {
        energia = energia + 10
    }

    method comer(alimento) {
        energia = energia + alimento.energiaQueAporta()
    }
    
    method estaCansada() {
        return energia < 30

    }

    method energia() = energia

} 

object alpiste {
    method energiaQueAporta() {
        return 25
    }
}

object manzana {
    const caloriasDeBase = 20
    var gradoDeMadurez = 1
    
    method energiaQueAporta() {
        return caloriasDeBase * self.escala()
    }

    method escala() {
        return if (gradoDeMadurez < 3){
            gradoDeMadurez
        } else { 0 }
    }

    method madurar() {
        gradoDeMadurez = gradoDeMadurez + 1
    }
}

object pepon {
    var energia = 30

    method comer(alimento) {
        energia = energia + alimento.energiaQueAporta() / 2
    }

    method volar(distancia) {
        energia = energia - 20 - 2*distancia
    }

    method estaCansada() {
        return energia < 34
    }
}

object rebeca {
    var ave = pepita
    var cenas = 0

    method ave(_ave) { 
        ave = _ave
        cenas = 0
    }

    method alimentar(alimento) {
        ave.comer(alimento)
        cenas = cenas + 1
    }

    method cenas() {
        return cenas
    }
}
