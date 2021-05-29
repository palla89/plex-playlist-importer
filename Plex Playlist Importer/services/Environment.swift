//
//  ServiceLocator.swift
//  Plex Playlist Importer
//
//  created by Alberto Paladino on 03/05/2021.
//

import Foundation

public class Environment {
    
    static let shared = Environment()
    let apiService = APIService()
    let sessionService = SessionService()
    
}
