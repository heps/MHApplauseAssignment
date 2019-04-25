//
//  ViewController.swift
//  MHApplauseAssignment
//
//  Created by Maciej Hepner on 24/04/2019.
//  Copyright © 2019 Maciej Hepner. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UITextFieldDelegate {
	var allRepositories: Repositories?
	var filteredRepositories: Repositories?
	@IBOutlet var filterField: UITextField!
	@IBOutlet var collectionView: UICollectionView!
	let resultsLimit = 10
	@IBOutlet var spinner: UIActivityIndicatorView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		guard let url = URL(string: "https://api.github.com/users/applauseoss/repos") else {
			print("Error: Empty endpoint url")
			return
		}
		
		let task = URLSession.shared.repositoriesTask(with: url) { [weak self] repositories, response, error in
			if let repositories = repositories, let self = self {
				self.allRepositories = repositories
				DispatchQueue.main.async {
					self.spinner.removeFromSuperview()
					self.filterRepositoriesAndReloadCollectionViewIfNeeded(by: "")
				}
			}
		}
		task.resume()
	}
	
	func filterRepositories(by string: String, resultsChanged: (() -> (Void))?) {
		guard let allRepositories = self.allRepositories else {
			print("No repos to filter")
			self.filteredRepositories = nil
			return
		}
		let newResults = MHApplauseAssignment.filterRepositories(allRepositories, by: string)
		if newResults != self.filteredRepositories ?? [] {
			self.filteredRepositories = newResults
			resultsChanged?()
		}
	}
	
	func filterRepositoriesAndReloadCollectionViewIfNeeded(by string: String) {
		self.filterRepositories(by: string) { () -> (Void) in
			self.collectionView.reloadSections(IndexSet(integer: 0))
		}
	}

	func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
		let newText = (textField.text! as NSString).replacingCharacters(in: range, with: string)
		self.filterRepositoriesAndReloadCollectionViewIfNeeded(by: newText)
		return true
	}
	
	func showRepositoryInfo(with id: Int) {
		var selectedRepository: Repository?
		for repository in filteredRepositories ?? [] {
			if repository.id == id {
				selectedRepository = repository
				break
			}
		}
		let alert = UIAlertController(title: "Repository info", message: selectedRepository?.getDescription(), preferredStyle: .alert)
		alert.addAction(UIAlertAction(title: "Close", style: .cancel, handler: { [weak self] (_) in
			self?.dismiss(animated: true, completion: nil)
		}))
		self.present(alert, animated: true, completion: nil)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return min(resultsLimit + 1, filteredRepositories?.count ?? 0)
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tile", for: indexPath) as! RepoCellView
		if let filteredRepositories = filteredRepositories {
			if indexPath.row == resultsLimit {
				cell.nameLabel.text = "(+" + String(filteredRepositories.count - resultsLimit) + " more)"
				cell.correspondingId = nil
			} else {
				cell.nameLabel.text = filteredRepositories[indexPath.row].name
				cell.correspondingId = filteredRepositories[indexPath.row].id
			}
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		guard let cell = collectionView.cellForItem(at: indexPath) as? RepoCellView else {
			print("Error: unexpected cell type")
			return
		}
		guard let repoId = cell.correspondingId else {
			print("No repo id to search")
			return
		}
		showRepositoryInfo(with: repoId)
	}
}

