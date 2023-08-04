//
//  MayoExerciseTests.swift
//  MayoExerciseTests
//
//  Created by Mayo Clinic on 04/08/23.
//

import XCTest
@testable import MayoExercise

final class MayoExerciseTests: XCTestCase {

    var useCase: MockListUseCase!
    
    override func setUpWithError() throws {
        
        useCase = MockListUseCase()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testViewDidLoad_SuccessResponse_WithEmptyPackage() throws {
        let sut = ListViewModel(usecase: useCase)
        var uiStateSink: [ListUIState] = []
        
        useCase.response = .success(.mock(package: []))
        
        sut.uiState = { uiState in
            uiStateSink.append(uiState)
        }
                
        sut.viewDidLoad()
        
        XCTAssertEqual(uiStateSink, [.loading, .empty])
        XCTAssertEqual(sut.noOfHeadlines, 0)
    }
    
    func testViewDidLoad_SuccessResponse_WithOneListImage() throws {
        let sut = ListViewModel(usecase: useCase)
        var uiStateSink: [ListUIState] = []
        
        useCase.response = .success(.mock(package: [.mock(items: [.mock(images: [.mockItemImage, .mockListImage, .mockuri])])]))
        
        sut.uiState = { uiState in
            uiStateSink.append(uiState)
        }
                
        sut.viewDidLoad()
        
        XCTAssertEqual(uiStateSink, [.loading, .success])
        XCTAssertEqual(sut.noOfHeadlines, 1)
    }
    
    func testViewDidLoad_SuccessResponse_WithoutListImage() throws {
        let sut = ListViewModel(usecase: useCase)
        var uiStateSink: [ListUIState] = []
        
        useCase.response = .success(.mock(package: [.mock(items: [.mock(images: [.mockItemImage, .mockuri])])]))
        
        sut.uiState = { uiState in
            uiStateSink.append(uiState)
        }
                
        sut.viewDidLoad()
        
        XCTAssertEqual(uiStateSink, [.loading, .success])
        XCTAssertEqual(sut.noOfHeadlines, 0)
    }
    
    func testViewDidLoad_SuccessResponse_WithoutMultipleListImage() throws {
        let sut = ListViewModel(usecase: useCase)
        var uiStateSink: [ListUIState] = []
        
        useCase.response = .success(.mock(package: [.mock(items: [
            .mock(images: [.mockListImage, .mockuri]),
            .mock(images: [.mockListImage, .mockuri])
        ])]))
        
        sut.uiState = { uiState in
            uiStateSink.append(uiState)
        }
                
        sut.viewDidLoad()
        
        XCTAssertEqual(uiStateSink, [.loading, .success])
        XCTAssertEqual(sut.noOfHeadlines, 2)
    }
    
    func testViewDidLoadWithServerError() throws {
        let sut = ListViewModel(usecase: useCase)
        var uiStateSink: [ListUIState] = []
        
        useCase.response = .failure(.serverError(MockError.serverError))
        
        sut.uiState = { uiState in
            uiStateSink.append(uiState)
        }
        
        sut.viewDidLoad()
        
        XCTAssertEqual(uiStateSink, [.loading, .failure])
    }
}
