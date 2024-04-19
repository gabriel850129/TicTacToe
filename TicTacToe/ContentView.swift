//
//  ContentView.swift
//  TicTacToe
//
//  Created by Gabriel Estévez López on 4/18/24.
//

import SwiftUI

struct ContentView: View {
    @Environment(Juego.self) private var juego
    var mostrarMensaje: Binding<Bool>{
        Binding(
            get: {
                juego.mostrarMensaje
            },
            set: {
                juego.mostrarMensaje = $0
            }
        )
    }
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
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.white)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,maxHeight: .infinity)
                                .shadow(radius: 5)
                            Text(celda.VerCelda())
                                .font(.system(size: 60))
                                .foregroundColor(celda.VerColor())
                                .aspectRatio(1, contentMode:.fit)
                                .background(Color.white)
                            
                        }.onTapGesture {
                            juego.asignarCelda(fila, columna)
                        }
                    }
                    
                }
            }
        }
        .background(.clear)
        .padding()
        .alert(isPresented: mostrarMensaje){
            Alert(title: Text(juego.mensajeAlerta),dismissButton: .default(Text("OK"), action: {juego.resetearTablero()}))
            
        }
        
        
        Text("Ceros: \(juego.puntuacionCeros)")
            .font(.title)
            .bold()
            .padding()
        Button(action:juego.resetearTablero, label: {
            Text("Reset")
            Image(systemName: "repeat")
        })
    }
    
    
    
}

#Preview {
    ContentView()
        .environment(Juego())
}
