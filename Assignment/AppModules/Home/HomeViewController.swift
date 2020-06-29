//
//  HomeViewController.swift
//  Assignment
//
//  Created by Saurabh Borate on 28/06/20.
//

import UIKit
import GradientLoadingBar
class HomeViewController: UIViewController {
    let viewModel = HomeViewModel()
    let gradientLoadingBar = GradientLoadingBar()
    
    @IBOutlet weak var tblMediaList: UITableView!

    @IBOutlet weak var test: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.loadMedia()
        viewModel.postList.bind { (Posts) in
            self.tblMediaList.reloadData()
        }
        viewModel.loader.bind { (show) in
            if show == true { self.gradientLoadingBar.show()}
            else { self.gradientLoadingBar.hide() }
        }
        tblMediaList.rowHeight = UITableView.automaticDimension
        tblMediaList.estimatedRowHeight = 316
    }
    
    
    
}
extension HomeViewController :UITableViewDelegate , UITableViewDataSource
{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.postList.value.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let post = viewModel.postList.value[indexPath.row]
        if (post.media?.isEmpty)!
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCellWithoutImage", for: indexPath) as! MediaCellWithoutImage
            cell.postData = post
            cell.setUpData()
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "MediaCell", for: indexPath) as! MediaCell
            cell.postData = post
            cell.setUpData()
            cell.selectionStyle = .none
            return cell
        }
        
    }
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}
