//
//  UIImageView+Extension.swift
//  MayoExercise
//
//  Created by Mayo Clinic on 04/08/23.
//

import Foundation
import UIKit

extension UIImageView {
    internal func setImage(from urlString: String) {
        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: URLRequest(url: url)) { [weak self] data, _, _ in
            guard let data  = data else { return }

            DispatchQueue.main.async {
                self?.image = UIImage(data: data)
            }
        }.resume()
    }
}
