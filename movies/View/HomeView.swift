//
//  HomeView.swift
//  movies
//
//  Created by Jesus Grimaldo on 28/09/22.
//

import SwiftUI
import Foundation

struct HomeView: View {
    @State private var selection = 0
    @StateObject var json = ModeloViewModel()
    @State var favoritos: Bool = false
    @State var cancelar: Bool = false
    
    
   

var body: some View {
        NavigationView{
          
            VStack {
                List(json.dataModelo, id: \.id){ item in
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [  .green, .blue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    HStack(alignment: .top, spacing: 10){
                        
                        CardView(poster: item.show.image.original ){
                            print("action")
                        }
                        
                        Text(item.show.name)
                            .font(.title2)
                            .foregroundColor(.black)
                            .swipeActions {
                                Button{
                                    favoritos.toggle()
                                    print("Favoritos")
                                }label: {
                                    if favoritos{
                                
                                        Label("Delate", systemImage: "trash.fill")
                                           
                                    }else{
                                        Label("Favoritos", systemImage: "star.fill")
                                            
                                    }
                                }
                            } .tint(.green)
                    
                        NavigationLink(destination: MoviesDetalleView(id: item.id, name: item.show.name, summary: item.show.summary ?? " ", image: item.show.image.original, favoritos: favoritos, language: item.show.language)){
                            
                            
                        }
                        
                    }
                }
             }
              // Lo agregue para que al momento de darle scrool hacia abajo se recargue la vista
                .refreshable {
                    print("Recargar Informacion ...")
                }
                
                
            }.onAppear{
                json.fetch()
                
                
            }
            .navigationTitle("TV Show")
            
        
        }
    }

}



struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CardView: View{
    
    var poster: String
    var action : () -> Void
    
    var body: some View{
        
        AsyncImage(url: URL(string: "\(poster)")){ imagen in
            imagen.resizable()
                .aspectRatio(contentMode: .fit)
                .shadow(radius: 1)
                .padding(.all)
        }placeholder: {
            // es para que en dado caso que no tenga o cargue su imagen aparesca esta imagen
            Image("Unknown")
                .aspectRatio(contentMode: .fit)
               .shadow(radius: 1)
                .padding(.leading)
        }

        // Es para que al momento de que no cargue una  imagen darle un toque y se cargue
        .onTapGesture {
            action()
        }
        
    }
    
}


