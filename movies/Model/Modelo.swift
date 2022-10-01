//
//  Modelo.swift
//  movies
//
//  Created by Jesus Grimaldo on 28/09/22.
//

import Foundation




struct Modelo: Codable {
    let id: Int
    let image : foto?
    let name: String
    let summary: String?
    let show : show
    }

struct foto: Codable {
    let  original: String
}
struct show: Codable {
    let id: Int
    let url: String
    let name: String
    let summary : String?
    let image : foto
   
    let language: String
  
}



enum Day: String, Codable {
    case friday = "Friday"
    case monday = "Monday"
    case saturday = "Saturday"
    case sunday = "Sunday"
    case thursday = "Thursday"
    case tuesday = "Tuesday"
    case wednesday = "Wednesday"
}


