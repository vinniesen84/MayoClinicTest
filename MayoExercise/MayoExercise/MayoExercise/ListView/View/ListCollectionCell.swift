//
//  ListCollectionCell.swift
//  MayoExercise
//
//  Created by Mayo Clinic on 04/08/23.
//

import UIKit

internal class ListCollectionCell: UICollectionViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var baseView: UIView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var labelName: UILabel!
    @IBOutlet private weak var labelHeadlines: UILabel!
    
    // MARK: - Methods

    internal required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.cornerRadius = 8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.withAlphaComponent(0.05).cgColor
    }
        
    internal func configure(headline: Headline) {
        imageView.image = nil
        // TODO Image caching can be added here
        imageView.setImage(from: headline.imageUrl)
        labelName.text = headline.name
        labelHeadlines.text = headline.details
        
        addShadow()
    }
    
    private func addShadow() {
        baseView.layer.shouldRasterize = true
        baseView.layer.masksToBounds = true

        baseView.layer.shadowRadius = layer.cornerRadius
        baseView.layer.shadowColor = UIColor.black.cgColor
        baseView.layer.shadowOpacity = 0.3
        baseView.layer.shadowOffset = .zero
    }
}
