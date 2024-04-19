//
//  Celda.swift
//  TicTacToe
//
//  Created by Gabriel Estévez López on 4/18/24.
//

import Foundation
import SwiftUI

struct Celda{
    var tipoCelda: TipoCelda
    
    func VerCelda() -> String{
        switch(tipoCelda){
        case TipoCelda.Cero:
            return "0"
        case TipoCelda.Cruz:
            return "X"
        case .Vacio:
            return ""
            
        }
        
        
    }
    
    func VerColor() -> Color{
        switch(tipoCelda){
        case TipoCelda.Cero:
            return Color.red
        case TipoCelda.Cruz:
            return Color.black
        case .Vacio:
            return .clear
        }
        
        
    }
    

}

enum TipoCelda{
    case Cero
    case Cruz
    case Vacio
}
