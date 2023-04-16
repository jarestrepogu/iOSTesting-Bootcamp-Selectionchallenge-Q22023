//
//  UIImageView+Extensions.swift
//  miniBootcampChallenge
//
//  Created by Jorge Andres Restrepo Gutierrez on 29/03/23.
//

import UIKit

public extension UIImageView {
    func fetchImageFromURL(urlString: String) {
        Task {
            do {
                let data = try await fetchImageData(urlString:urlString)
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self.image = image
                    }
                }
            }
            catch {
                print("Failed to load images")
            }
        }
    }
    
    private func fetchImageData(urlString: String) async throws -> Data {
        let url = URL(string: urlString)!
        let (data, _) = try await URLSession.shared.data(from: url)
        return data
    }
}
