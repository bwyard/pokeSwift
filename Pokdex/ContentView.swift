//
//  ContentView.swift
//  Pokdex
//
//  Created by Dawn Moses on 10/4/21.
//

import SwiftUI

struct ContentView: View {
    var pokemonModel = PokemonModel()
    @State private var pokemon = [Pokemon]()
    
    var body: some View {
        NavigationView{
            List(pokemon) { poke in
                HStack{
                    VStack(alignment: .leading, spacing: 5){
                        Text(poke.name.capitalized)
                            .font(.title)
                        Text(poke.type.capitalized)
                            .italic()
                        Text(poke.description)
                    }
                }
            }
            
        .navigationTitle("Pokemon")
    }
        .onAppear {
            async {
                pokemon = try! await pokemonModel.getPokemon()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
