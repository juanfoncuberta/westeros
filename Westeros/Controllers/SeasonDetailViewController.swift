//
//  SeasonDetailViewController.swift
//  Westeros
//
//  Created by Juan Foncuberta on 26/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

class SeasonDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nChaptersLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
 
    
    //MARK: - Properties
    var model: Season
    
    //MARK: - Initialization
    init(model: Season){
        self.model = model
        super.init(nibName:nil, bundle:nil)
        title = model.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelSeasonLVC()
        setUpSeasonLVC()
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
    
    func syncModelSeasonLVC(){
        nameLabel.text = model.name
        nChaptersLabel.text = String(model.count)
        //dateLabel.text = Season.convertDateToString(date: model.releaseDate)
        dateLabel.text = "Pending publication"
    }
    
    //MARK: - Setup UI
    func setUpSeasonLVC(){
        
        let episodesButton = UIBarButtonItem(title: "Episodes", style: .done, target: self, action: #selector(displayEpisodes))
        navigationItem.rightBarButtonItem = episodesButton
    }

    
    @objc func displayEpisodes(){
        
        let episodesListVC = EpisodeListViewController(model:model.sortedEpisodes)
        navigationController?.pushViewController(episodesListVC, animated: true)
        
    }
  

}


extension SeasonDetailViewController: SeasonListViewControllerDelegate{
    func SeasonListViewController(_ vc: SeasonListViewController,didSelectSeason season:Season){
        self.model = season
        syncModelSeasonLVC()
    }
}
