//
//  APIService.swift
//  Plex Playlist Importer
//
//  created by Alberto Paladino on 06/11/2020.
//

import Foundation

enum APIError: Error {
    case urlError
    case dataError
    case internalError
    case emptyToken
}

class APIService {
    
    //MARK: Upload Playlist
    
    func upload(serverURL: String, port: Int, token: String, sectionId: Int, path: String, completion: @escaping (Result<String, Error>) -> Void) {
        
        var urlComponents = URLComponents(string: serverURL)!
        urlComponents.port = port
        urlComponents.path = "/playlists/upload"
        guard let url = urlComponents.url else {
            completion(.failure(APIError.urlError))
            return
        }
        
        var parameters: [URLQueryItem] = []
        parameters.append(URLQueryItem(name: "sectionID", value: String(sectionId)))
        parameters.append(URLQueryItem(name: "path", value: path))
        parameters.append(URLQueryItem(name: "X-Plex-Token", value: token))
        
        
        let request = URLRequest.requestPOST(with: url, parameters: parameters)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    DispatchQueue.main.async { completion(.success("ok")) }
                } else {
                    DispatchQueue.main.async { completion(.failure(APIError.dataError)) }
                }
            } else {
                DispatchQueue.main.async { completion(.failure(APIError.urlError)) }
            }
            
        }.resume()
    }
    
}
