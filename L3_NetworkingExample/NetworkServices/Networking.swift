//
//  Networking.swift
//  L3_NetworkingExample
//
//  Created by Ihor Malovanyi on 28.10.2022.
//

import Foundation

final class Network<T: Endpoint> {
    
    enum Result {
        
        case data(Data?)
        case error(Error)
        
    }
    
    enum NetworkError: Error {
        
        case badHostString
        
    }
    
    enum Method: String {
        
        case get = "GET"
        case post = "POST"
        case delete = "DELETE"
        case put = "PUT"
        case patch = "PATCH"
        
    }
    
    private var host: URL
    private var headers: [String : String]
    private var session = URLSession.shared
    
    init(_ hostString: String, headers: [String : String] = [:]) throws {
        if let url = URL(string: hostString) {
            self.host = url
            self.headers = headers
            
            return
        }
        
        throw NetworkError.badHostString
    }
    
    private func makeRequest(_ method: Method, _ endpoint: T, _ parameters: NetworkRequestBodyConvertible?) -> URLRequest {
        var request = URLRequest(url: host.appending(path: endpoint.pathComponent))
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        
        if method == .get {
            request.url?.append(queryItems: parameters?.queryItems ?? [])
        } else if method == .post {
            request.httpBody = parameters?.data
        }
        
        return request
    }
    
    func perform(_ method: Method, _ endpoint: T, _ parameters: NetworkRequestBodyConvertible? = nil) async throws -> Data {
        let request = makeRequest(method, endpoint, parameters)
        let (data, _) = try await session.data(for: request)
        return data
    }
    
}












