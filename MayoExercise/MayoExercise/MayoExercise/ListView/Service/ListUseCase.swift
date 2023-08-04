//
//  ListUseCase.swift
//  MayoExercise
//
//  Created by Mayo Clinic on 04/08/23.
//

import Foundation

internal enum NetworkError: Error {
    case decodingError
    case serverError(Error)
}

internal protocol ListUseCase {
    func fetchHeadlines(appId: String, date: String, completionHandler: @escaping(Result<ListResponse, NetworkError>)->Void)
}

internal class DefaultListUseCase: ListUseCase {
    private let apiService = NetworkService()
    
    internal func fetchHeadlines(appId: String, date: String, completionHandler: @escaping(Result<ListResponse, NetworkError>)->Void) {
        
        let endPoint = "content/list"
        
        let parameter: [String: String] = ["ApplicationId": appId,
                                           "RequestDate": date]
        
        apiService.request(endPoint: endPoint,
                           parameter: parameter,
                           type: .post) { result in
            switch result {
            case let .success(data):
               
                let decoder = JSONDecoder()
                do {
                    let list = try decoder.decode(ListResponse.self, from: data)
                    completionHandler(.success(list))
                } catch _ {
                    completionHandler(.failure(.decodingError))
                }
                
            case let .failure(error):
                completionHandler(.failure(.serverError(error)))
            }
        }
    }
}
