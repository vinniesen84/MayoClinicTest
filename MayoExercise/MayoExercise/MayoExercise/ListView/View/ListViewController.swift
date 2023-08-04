//
//  ListViewController.swift
//  MayoExercise
//
//  Created by Mayo Clinic on 04/08/23.
//

import UIKit

internal class ListViewController: UICollectionViewController {
    
    private let viewModel: ListViewModel
    
    internal required init?(coder: NSCoder) {
        viewModel = ListViewModel(usecase: DefaultListUseCase())
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
        
        viewModel.uiState = { [weak self] uiState in
            switch uiState {
            case .loading, .failure:
                break
            case .success, .empty:
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            }
        }
    }
}


// MARK: - Collection Data source methods

extension ListViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.noOfHeadlines
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCollectionCell.identifier, for: indexPath) as? ListCollectionCell else { return UICollectionViewCell() }
        
        cell.configure(headline: viewModel.headline(for: indexPath))
        return cell
    }
}

// MARK: - Collection Layout methods

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = screenSize.width/2-21
        return CGSize(width: cellWidth, height: cellWidth*3/2)
    }
}
