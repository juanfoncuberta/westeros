//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Juan Foncuberta on 27/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    //MARK: - Properties
    var model: Person
    
    //MARK: - Initialization
    init(model:Person){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //MARK: - Sync

    func syncModelWithView(){
        nameLabel.text = model.name
        houseLabel.text = model.house.name
    }

   

}


extension MemberDetailViewController: MemberListViewControllerDelegate{
    func MemberListViewController(_ vc: MemberListViewController) {
//        self.model = member
//        syncModelWithView()
        navigationController?.pushViewController(self, animated: true)
        
    }
}
