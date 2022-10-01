//
//  MoviesDetalleView.swift
//  movies
//
//  Created by Jesus Grimaldo on 29/09/22.
//

import SwiftUI

struct MoviesDetalleView: View {
    @State var id: Int
    @State var name: String
    @State var summary: String
    @State var image:String
    @State var favoritos: Bool
    @State var alerta: Bool =  true
 
    let language: String
    
    
    
    
    var body: some View {
        VStack{
            ScrollView(.vertical,showsIndicators: false){
                ZStack{
                    LinearGradient(gradient: Gradient(colors: [  .gray, .white]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                    VStack{
                        
                        CardView(poster: image){
                            print("action")
                        }
                        HStack{
                            Text("Favorita")
                                .font(.title2)
                                .foregroundColor(.blue)
                            Spacer()
                            
                            Button{
                                favoritos.toggle()
                                print("Favoritos")
                            }label: {
                                if favoritos{
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                    
                                    
                                }else {
                                    Image(systemName: "star")
                                    
                                }
                            }
                            
                        }
                        .alert(isPresented: $favoritos,content:{
                            Alert(title: Text(" Eliminar"),message: Text("¿Deseas Eliminar de Favoritos?"), primaryButton: .default(Text("Aceptar"), action: {
                                
                                
                                self.favoritos
                            })
                                  
                                  , secondaryButton: .destructive(Text("Cancelar"), action: {
                                self.favoritos.toggle()
                            }))
                        })
                        
                        Spacer()
                        HStack{
                        Text("Idioma:").font(.subheadline)
                            .foregroundColor(.blue)
                        Text(language).font(.title3).foregroundColor(.red)
                            Spacer()
                    }
                        
                        Text(summary).font(.subheadline)
                            .foregroundColor(.purple)
                            .bold()
                        
                        
                    }
                }
            }
        }.navigationTitle(name)
    }
}

