//
//  ModeloViewModel.swift
//  movies
//
//  Created by Jesus Grimaldo on 28/09/22.
//

import Foundation


class ModeloViewModel: ObservableObject {
    
    @Published var dataModelo : [Modelo] = []
   
   // dataModelo.append(isFa)
  
    func fetch(){
        
        guard let url = URL(string: "https://api.tvmaze.com/schedule") else { return }
        URLSession.shared.dataTask(with: url) {data,_,_ in
            
            guard let data = data else { return }
            
            do{
                let json = try JSONDecoder().decode([Modelo].self, from: data)
            
                DispatchQueue.main.async {
                    self.dataModelo = json
             
                    
                }
            }catch let error as NSError {
                print(String(describing: error))
            }
        }.resume()
        
      
    }
}
