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
    
    @IBOutlet weak var coverFilter: UISwitch!
    @IBOutlet weak var txtSearchBook: UITextField!
    
    @IBOutlet weak var btnBack: UIButton!
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
        setupUI()
    }
    func setupUI(){
        btnBack.setTitleColor(UIColor.RoyalBlueColor, for: .normal)
        btnBack.setTitle(self.viewModel.searchTopic, for: .normal)
        
        
        txtSearchBook.setLeftImage(imageName: "Search")
        txtSearchBook.tintColor = UIColor.RoyalBlueColor
        txtSearchBook.textColor = UIColor.MineShaftColor
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        viewModel.loadBooksWithTopic()
        
    }
    
    @IBAction func btnBackAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func updateCoverFilter(_ sender: Any) {
        viewModel.updateCoverFilter()
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
        
        return CGSize(width: collectionView.bounds.size.width/3.7, height: (collectionView.bounds.size.width/3)*1.8)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if  let book = viewModel.booksArray.value[indexPath.item].formats?.textHTMLCharsetISO88591 {
            
            self.view.endEditing(true)
            if let url = URL(string: book) {
                UIApplication.shared.open(url)
            }
        }
        else {
            let ctr = UIAlertController.init(title: "Oops", message: "Sorry No web Preview available", preferredStyle: .alert)
            let cancel = UIAlertAction.init(title: "Cancel", style: .destructive) { (act) in
                ctr.dismiss(animated: true, completion: nil)
            }
            ctr.addAction(cancel)
            self.present(ctr, animated: true, completion: nil)
        }
        
        
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
        
        viewModel.updateSearch(searchText: newString)
        
        return true
        
    }
    
    
}
extension UITextField{

    func setLeftImage(imageName:String) {

        let imageView = UIImageView(frame: CGRect(x: 10, y: 0, width: 50, height: 50))
        imageView.image = UIImage(named: imageName)
        self.leftView = imageView;
        self.leftViewMode = .always
    }
}
