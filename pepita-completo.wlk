object pepita{ 
    var energia = 100
 
    method volar(distancia) { 
        self.validarPuedeVolar(distancia)
        energia = self.energiaQueGasta(distancia)
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

    method energia(_energia) {
        energia = _energia
    }

    method validarPuedeVolar(distancia){
        if (self.energiaQueGasta(distancia) < 0){
            self.error("No puede volar, no tiene suficiente energia")
        }  
    }

    method energiaQueGasta(distancia){
        return energia - 10 - distancia/10
    } 

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
        gradoDeMadurez += 1
    }
}

object pepon {
    var energia = 30
    var ultimoAlimento = manzana

    method comer(alimento) {

        self.validarUltimoAlimento(alimento)
        energia = energia + alimento.energiaQueAporta() / 2
        ultimoAlimento = alimento   

    }

    method validarUltimoAlimento(alimento) {
        if (ultimoAlimento == alimento) {
            self.error("No puede comer el mismo alimento dos veces seguidas")
        }

    }

    method volar(distancia) {
        energia = energia - 20 - 2*distancia
    }

    method estaCansada() {
        return energia < 34
    }
    
    method energia() = energia 

    method energia(_energia) {
        energia = _energia  
      
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
