//
//  EpisodeDetailViewController.swift
//  Westeros
//
//  Created by Juan Foncuberta on 26/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

class EpisodeDetailViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var airDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Properties

    var model: Episode
    
    //MARK: - Initialization
    
    init(model: Episode){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = model.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
      syncModelEpisodeDVC()
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
    func syncModelEpisodeDVC(){
        titleLabel.text = model.title
        airDateLabel.text = "Pending publication"
       // print(titleLabel!.text)
       
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EpisodeDetailViewController: EpisodeListViewControllerDelegate{
    func EpisodeListViewController(_ vc: EpisodeListViewController, didSelectEpisode episode: Episode) {
        self.model = episode
        print("hola")
        print(episode)
        syncModelEpisodeDVC()
         navigationController?.pushViewController(self, animated: true)
    }
    
  
}
