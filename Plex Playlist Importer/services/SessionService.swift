//
//  SessionService.swift
//  Plex Playlist Importer
//
//  created by Alberto Paladino on 29/06/2021.
//

import Foundation

class SessionService {
    
    private struct Key {
        static let serverURL = "ServerURL"
        static let sectionID = "SectionID"
        static let path = "Path"
        static let token = "Token"
        static let port = "Port"
    }
        
    var serverURL: String? = nil
    var sectionID: String? = nil
    var path: String? = nil
    var token: String? = nil
    var port: String? = "32400"
    
    func loadData() {
        let defaults = UserDefaults.standard
        serverURL = defaults.string(forKey: Key.serverURL)
        sectionID = defaults.string(forKey: Key.sectionID)
        path = defaults.string(forKey: Key.path)
        token = defaults.string(forKey: Key.token)
        port = defaults.string(forKey: Key.port)

    }
    
    func saveDefault(serverURL: String? = nil, sectionID: String? = nil, path: String? = nil, token: String? = nil, port: String? = "32400") {
        self.serverURL = serverURL
        self.sectionID = sectionID
        self.path = path
        self.token = token
        self.port = port

        let defaults = UserDefaults.standard
        defaults.setValue(serverURL, forKey: Key.serverURL)
        defaults.setValue(sectionID, forKey: Key.sectionID)
        defaults.setValue(path, forKey: Key.path)
        defaults.setValue(token, forKey: Key.token)
        defaults.setValue(port, forKey: Key.port)

    }
    
    func saveData() {
        saveDefault(serverURL: self.serverURL, sectionID: self.sectionID, path: self.path, token: self.token, port: self.port)
    }
    
}
