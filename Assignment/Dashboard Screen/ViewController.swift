//
//  ViewController.swift
//  Assignment
//
//  Created by Saurabh Borate on 22/05/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lblTitle: UILabel!
    
    @IBOutlet weak var lblSubTitle: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = DashBoardVM()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }

    func setupUI(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.lblTitle.textColor = UIColor.RoyalBlueColor
        self.lblSubTitle.textColor = UIColor.MineShaftColor
    }
}


extension ViewController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.topics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "topicsCell", for: indexPath) as! topicsCell
        cell.topicLbl.text = viewModel.topics[indexPath.row]
        cell.topicImg.image = UIImage.init(named: viewModel.topics[indexPath.row])
        return cell
    }
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(viewModel.showTopicsDetail(index: indexPath.row), animated: true)
    }
}

