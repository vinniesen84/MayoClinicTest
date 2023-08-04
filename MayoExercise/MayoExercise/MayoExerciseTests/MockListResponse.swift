//
//  MockListResponse.swift
//  MayoExerciseTests
//
//  Created by Rajmani Kushwaha on 04/08/23.
//

import Foundation
@testable import MayoExercise

extension ListResponse {
    static func mock(package: [Package]) -> Self {
        ListResponse(packages: package)
    }
}

extension Package {
    static func mock(items: [Item]) -> Self {
      Package(id: "", items: items)
    }
}

extension Item {
    static func mock(images: [Image]) -> Self {
      Item(images: images,
           name: "John",
           category: .mock)
    }
}

extension MayoExercise.Category {
    static let mock = MayoExercise.Category(name: "John")
}

extension Image {
    static let mockListImage = Image(type: .listImage, value: "url")
    static let mockItemImage = Image(type: .itemImage, value: "url")
    static let mockuri = Image(type: .uri, value: "url")
}
