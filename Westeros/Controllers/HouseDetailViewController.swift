//
//  HouseDetailViewController.swift
//  Westeros
//
//  Created by Juan Foncuberta on 12/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

class HouseDetailViewController: UIViewController {

    //MARK: - Outlets
  
    @IBOutlet weak var houseNameLabel: UILabel!
    @IBOutlet weak var sigilImageView: UIImageView!
    @IBOutlet weak var wordsLabel: UILabel!
    
    //MARK: - Properties
    var model: House
    
    //MARK: - Initilization
    init(model: House){
        self.model = model
       
        super.init(nibName: nil, bundle: Bundle(for:type(of:self)))
        
         title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*init(model: House){
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //synchModelWithView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupUI()
        synchModelWithView()
    }
    
    //MARK: - Sync
    func synchModelWithView(){
        houseNameLabel.text = "House \(model.name)"
        sigilImageView.image = model.sigil.image
        wordsLabel.text = model.words
        let backItem = UIBarButtonItem()
        backItem.title = model.name
        navigationItem.backBarButtonItem = backItem
        
    }
    
    //MARK: - UI
    
    func setupUI(){
        let wikiButton = UIBarButtonItem(title: "Wiki", style: .plain, target:self , action: #selector(displayWiki))
        
        let membersButton = UIBarButtonItem(title: "Members", style: .plain, target: self, action: #selector(displayMembers))
        navigationItem.rightBarButtonItems = [membersButton, wikiButton]
    }
    
    @objc func displayWiki(){
        
        //creamos el wikivc
        let wikiViewController = WikiViewController(model:model)
        //hacemos push
        navigationController?.pushViewController(wikiViewController, animated: true)
    }
    
    @objc func displayMembers(){
        //creamos VC
        
        let memberlistViewController = MemberListViewController(model:model.sortedMembers)
        
        //Hacemos Push
        navigationController?.pushViewController(memberlistViewController, animated: true)
    }
    

}


extension HouseDetailViewController: HouseListTableViewControllerDelegate{
    func HouseListTableViewController(_ vc: HouseListTableViewController, didSelectHouse house: House) {
        self.model = house
        synchModelWithView()
    }
    
    
}
