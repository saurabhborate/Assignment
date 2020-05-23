//
//  BookDetailVC.swift
//  Assignment
//
//  Created by Saurabh Borate on 22/05/20.
//

import UIKit
import GradientLoadingBar
class BooksVC: UIViewController {
 var viewModel = BooksVM()
    @IBOutlet weak var bookCollectionView: UICollectionView!
    
    let loader = GradientLoadingBar()
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.booksArray.bind { (books) in
            print("Books available \(books.count)")
            self.bookCollectionView.reloadData()
        }
        
        viewModel.loader.bind { (isAnimate) in
            
            if isAnimate {
                self.loader.show()
            }
            else {
                self.loader.hide()
            }
        }

    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadBooksWithTopic()
        
    }
}
// MARK: CollectionView Delegate
extension BooksVC : UICollectionViewDataSource , UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.booksArray.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == viewModel.booksArray.value.count - 1 { //
                viewModel.loadMoreBooks()
            
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BookCell", for: indexPath) as! BookCell
        cell.bookData = viewModel.booksArray.value[indexPath.item]
        cell.setupData()
        return cell
 
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            
        return CGSize(width: collectionView.bounds.size.width/3.7  , height: (collectionView.bounds.size.width/3)*1.8)

        }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.view.endEditing(true)
        //self.navigationController?.pushViewController(viewModel.getDetailsOfObject(index: indexPath), animated: true)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension BooksVC : UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let textFieldText: NSString = (textField.text ?? "") as NSString
        let newString = textFieldText.replacingCharacters(in: range, with: string)

       // viewModel.updateSearch(searchText: newString)

        return true
        
    }
    
}
