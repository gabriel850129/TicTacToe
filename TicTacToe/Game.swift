//
//  Game.swift
//  TicTacToe
//
//  Created by Gabriel Estévez López on 4/18/24.
//
//Echo con motivos Educativos.

import Foundation

@Observable

class Juego{
    
    var tablero = [[Celda]]() //arreglo de celdas
    var turno = TipoCelda.Cruz //para saber a quien le toca jugar
    var puntuacionCeros = 0 //puntuacion de los Ceros
    var puntuacionCruz = 0  //Puntuacion de las Crucez
    var mostrarMensaje = false
    var mensajeAlerta = "Empate"
    
    func resetearTablero(){
        var nuevoTablero=[[Celda]]()
        for  _ in 0...2 {
            
            var fila = [Celda]()
            
            for _ in 0...2 {
                
                fila.append(Celda(tipoCelda: TipoCelda.Vacio))
            }
            
            nuevoTablero.append(fila)
        }
        tablero=nuevoTablero
    }
    
    
    //Iniciador de la Clase Game
    init(){
        
        resetearTablero()
    }
    
    func verificarEmpate()-> Bool {
        //recorrer todas las filas y celdas de un tablero si encuentra vacia alguna
        //retornara falso porque aun no es empate o tabla
        for fila in tablero{
            for celda in fila {
                if celda.tipoCelda == TipoCelda.Vacio {
                    return false
                }
            }
        }
        return  true
    }
    
    func verificarTurno(_ fila: Int, _ columna: Int) ->Bool{
        //Retornar a si quien esta en esa fila es a quien le toca el turno
        return tablero[fila][columna].tipoCelda==turno
    }
    
    
    
    func verificarGanador()-> Bool{
        //Victoria Vertical
        
        if verificarTurno(0,0)
            && verificarTurno(1,0)
            && verificarTurno(2,0){
            return true
        }
        if verificarTurno(0,1)
            && verificarTurno(1,1)
            && verificarTurno(2,1){
            return true
        }
        if verificarTurno(0,2)
            && verificarTurno(1,2)
            && verificarTurno(2,2){
            return true
        }
        
        //Victorias Horizontales
        if verificarTurno(0,0)
            && verificarTurno(0,1)
            && verificarTurno(0,2){
            return true
        }
        if verificarTurno(1,0)
            && verificarTurno(1,1)
            && verificarTurno(1,2){
            return true
        }
        if verificarTurno(2,0)
            && verificarTurno(2,1)
            && verificarTurno(2,2){
            return true
        }
        
        //Victorias Diagonales
        if verificarTurno(0,0)
            && verificarTurno(1,1)
            && verificarTurno(2,2){
            return true
        }
        if verificarTurno(0,2)
            && verificarTurno(1,1)
            && verificarTurno(2,0){
            return true
        }
        
        return false
    }
    
    
    func textoTurno()->String{
        //Texto para mensaje de quien juega
        return turno == TipoCelda.Cruz ? "Juega: X": "Juega: 0"
    }
    
    func asignarCelda(_ fila: Int, _ columna: Int){
        //Si la celda no esta vacia no se le puede asignar ninguna otra
        if (tablero[fila][columna].tipoCelda != TipoCelda.Vacio){
            return
        }
        
        tablero[fila][columna].tipoCelda = turno == TipoCelda.Cruz ? TipoCelda.Cruz : TipoCelda.Cero
        
        if (verificarGanador()){
            //Si el ganador es cruz agregar puntos a su puntuacion
            if (turno==TipoCelda.Cruz){
                puntuacionCruz += 1
                
            } else{
                puntuacionCeros += 1
            }
            let ganador = turno == TipoCelda.Cruz ? "Cruces(X) ": "Ceros(0) "
            mensajeAlerta = "Ganador: " + ganador
            mostrarMensaje = true
        }else{
            turno = turno == TipoCelda.Cruz ? TipoCelda.Cero : TipoCelda.Cruz
        }
        
        if (verificarEmpate()){
            mostrarMensaje=true
            mensajeAlerta=" Empate!!"
        }
    }
    
    
}
