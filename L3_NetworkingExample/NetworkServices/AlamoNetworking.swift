//
//  AlamoNetworking.swift
//  L3_NetworkingExample
//
//  Created by Ihor Malovanyi on 28.10.2022.
//

import Foundation
import Alamofire

class AlamoNetworking<T: Endpoint> {
    
    enum Result {
        
        case data(Data?)
        case error(Error)
        
    }
    
    private var host: String
    private var headers: [String : String]
    
    init(_ hostString: String, headers: [String : String] = [:]) {
        self.host = hostString
        self.headers = headers
    }
    
    func perform(_ method: HTTPMethod, _ endpoint: T, _ parameters: NetworkRequestBodyConvertible) async throws -> Data {
        let response = await AF
            .request(host + "/\(endpoint.pathComponent)", method: method, parameters: parameters.parameters, headers: HTTPHeaders(headers))
            .serializingData().response
        
        print(response)
        if let error = response.error {
            throw error
        } else {
            return response.data!
        }
    }
    
}
