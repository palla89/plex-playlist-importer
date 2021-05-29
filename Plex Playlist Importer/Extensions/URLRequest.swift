//
//  URLRequest.swift
//  Plex Playlist Importer
//
//  created by Alberto Paladino on 29/06/2021.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

extension URLRequest {
    
    static func requestGET(with url: URL, parameters: [URLQueryItem]?, tokenAuth: String? = nil) -> URLRequest {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return URLRequest(url: url)
        }
        urlComponents.queryItems = parameters
        guard let composedUrl = urlComponents.url else {
            return URLRequest(url: url)
        }
        
        var request = URLRequest(url: composedUrl)
        request.timeoutInterval = 30
        
        request.httpMethod = HttpMethod.get.rawValue
        
        if let token = tokenAuth {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }

        return request
    }

    static func requestPOST(with url: URL, parameters: [URLQueryItem]?, httpBody: String? = nil, tokenAuth: String? = nil) -> URLRequest {
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            return URLRequest(url: url)
        }
        urlComponents.queryItems = parameters
        
        guard let composedUrl = urlComponents.url else {
            return URLRequest(url: url)
        }
        
        var request = URLRequest(url: composedUrl)
        request.timeoutInterval = 30        
        request.httpMethod = HttpMethod.post.rawValue
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(httpBody)
//        do {
//            request.httpBody = try JSONEncoder().encode(httpBody)
//        } catch {
//            print(String(describing: error))
//        }
        
        if let token = tokenAuth {
            request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return request
    }
    
}
