//
//  MockListUseCase.swift
//  MayoExerciseTests
//
//  Created by Rajmani Kushwaha on 04/08/23.
//

import Foundation
@testable import MayoExercise

enum MockError: Error {
    case serverError
}

class MockListUseCase: ListUseCase {
    
    var response: Result<MayoExercise.ListResponse, MayoExercise.NetworkError>?
    
    func fetchHeadlines(appId: String,
                        date: String,
                        completionHandler: @escaping (Result<MayoExercise.ListResponse, MayoExercise.NetworkError>) -> Void) {
        completionHandler(response!)
    }
}
