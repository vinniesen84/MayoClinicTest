//
//  ListResponse.swift
//  MayoExercise
//
//  Created by Mayo Clinic on 04/08/23.
//

import Foundation

internal struct ListResponse: Decodable {
    internal let packages: [Package]
    
    private enum CodingKeys: String, CodingKey {
        case packages = "Packages"
    }
}

internal struct Package: Decodable {
    internal let id: String
    internal let items: [Item]
    
    private enum CodingKeys: String, CodingKey {
        case id = "Id"
        case items = "Items"
    }
}

internal struct Item: Decodable {
    internal let images: [Image]
    internal let name: String
    internal let category: Category

    private enum CodingKeys: String, CodingKey {
        case images = "Images"
        case name = "Name"
        case category = "Category"
    }
}

internal struct Category: Decodable {
    internal let name: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "Name"
    }
}

internal struct Image: Decodable {
    private let imageType: String
    internal let value: String
    internal var type: ImageType? { ImageType(rawValue: imageType) }
    
    private enum CodingKeys: String, CodingKey {
        case imageType = "Type"
        case value = "Value"
    }
    
    internal init(type: ImageType, value: String) {
        self.imageType = type.rawValue
        self.value = value
    }
}

internal enum ImageType: String {
    case uri = "URI"
    case listImage = "DAILYCONTENTLISTIMAGEURL"
    case itemImage = "DAILYCONTENTITEMIMAGEURL"
}
