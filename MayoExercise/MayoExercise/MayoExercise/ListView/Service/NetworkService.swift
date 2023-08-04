//
//  NetworkService.swift
//  MayoExercise
//
//  Created by Mayo Clinic on 04/08/23.
//

import Foundation

internal enum RequestType: String {
    case post = "POST"
}

internal class NetworkService {
    
    internal static let basePath = "https://content.mcmapp.mayoclinic.org/api"
    internal static let version = "v2"

    internal func request(endPoint: String, parameter: [String: Any], type: RequestType, result: @escaping(Result<Data, Error>)-> Void) {
        
        guard let url = URL(string: "\(NetworkService.basePath)/\(NetworkService.version)/\(endPoint)") else {
            assertionFailure("Unable to create URL")
            return
        }
        
        let jsondata = try? JSONSerialization.data(withJSONObject: parameter)
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = type.rawValue
        urlRequest.httpBody = jsondata
        
        URLSession.shared.dataTask(with: urlRequest, completionHandler: { data, _, error in
            if error == nil, let data {
                result(.success(data))
            } else if let error {
                result(.failure(error))
            }
        }).resume()
    }
}
