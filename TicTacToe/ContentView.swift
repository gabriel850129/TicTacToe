//
//  ContentView.swift
//  TicTacToe
//
//  Created by Gabriel Estévez López on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(Juego.self) private var juego
    var body: some View {
        let borde = CGFloat(5)
        Text(juego.textoTurno())
            .font(.title)
            .bold()
            .padding()
        Spacer()
        Text("Cruces: \(juego.puntuacionCruz)")
            .font(.title)
            .bold()
            .padding()
        
        VStack{
            ForEach(0...2,id:\.self){ fila in
                HStack(spacing:borde){
                   
                    ForEach(0...2, id: \.self){columna in
                        let celda = juego.tablero[fila][columna]
                        Text(celda.VerCelda())
                            .font(.system(size: 60))
                            .foregroundColor(celda.VerColor())
                            .bold()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                            .aspectRatio(1, contentMode:.fit)
                            .background(Color.white)
                            .onTapGesture {
                                juego.asignarCelda(fila, columna)
                            }
                    }
                    
                }
            }
        }
        .background(Color.black)
        .padding()
//        .alert(isPresented: $juego.mostrarMensaje){
//            Alert(title: Text(juego.mostrarMensaje),
//                  dismissButton: .default(Text("OK"))){
//                juego.resetearTablero()
//            }
//        }
        
        
        Text("Ceros: \(juego.puntuacionCeros)")
            .font(.title)
            .bold()
            .padding()
        Button(action:juego.resetearTablero, label: {
            Text("Reset")
        })
    }
    
    

}

#Preview {
    ContentView()
        .environment(Juego())
}
