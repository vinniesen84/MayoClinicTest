//
//  ListViewModel.swift
//  MayoExercise
//
//  Created by Mayo Clinic on 04/08/23.
//

import Foundation

internal enum ListUIState {
    case loading
    case success
    case empty
    case failure
}

internal class ListViewModel {
    private let usecase: ListUseCase
    private var headlines: [Headline] = []
    
    internal var noOfHeadlines: Int {
        headlines.count
    }
    
    internal func headline(for indexPath: IndexPath) -> Headline {
        return headlines[indexPath.row]
    }
    
    internal var uiState: ((ListUIState) -> Void)? = nil
    
    init(usecase: ListUseCase) {
        self.usecase = usecase
    }
    
    internal func viewDidLoad() {
        let todaysDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let formattedDate = dateFormatter.string(from: todaysDate)
        
        uiState?(.loading)
        usecase.fetchHeadlines(appId: "MyMayoClinic",
                               date: formattedDate) { [weak self] result in
            guard let self else { return }
            switch result {
            case let .success(list):
                
                guard let headlines = list.packages.first?.items.compactMap ({ item -> Headline? in
                    // This will always get the first image with ListImage type
                    let contentImage = item.images.first { image in image.type == .listImage}
                    
                    guard let contentImage else { return nil }
                    return Headline(imageUrl: contentImage.value,
                                    name: item.category.name,
                                    details: item.name)
                }) else {
                    self.uiState?(.empty)
                    return
                }
                
                self.headlines = headlines
                self.uiState?(.success)
            
            case .failure:
                self.uiState?(.failure)
            }
        }
    }
}
