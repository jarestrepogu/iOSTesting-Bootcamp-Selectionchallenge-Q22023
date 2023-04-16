//
//  URLProvider.swift
//  miniBootcampChallenge
//

import Foundation

struct URLProvider {
    
    static var urls: [String] {
        guard let plist = Bundle.main.url(forResource: "Photos", withExtension: "plist"),
              let contents = try? Data(contentsOf: plist),
              let serial = try? PropertyListSerialization.propertyList(from: contents, format: nil),
              let serialUrls = serial as? [String] else { return [] }
        return serialUrls
    }
}
