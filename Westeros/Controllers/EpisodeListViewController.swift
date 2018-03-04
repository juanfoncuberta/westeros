//
//  EpisodeListViewController.swift
//  Westeros
//
//  Created by Juan Foncuberta on 26/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

//let LAST_EPISODE = "LastEpisode"
//let EPISODE_KEY = "EpisodeKey"
//let EPISODE_DID_CHANGE_NOTIFICATION_NAME = "EpisodeDidChange"


protocol EpisodeListViewControllerDelegate: class{
    func EpisodeListViewController(_ vc:EpisodeListViewController,didSelectEpisode episode: Episode)
}
class EpisodeListViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: - Properties
    var model: [Episode]
    weak var delegate: EpisodeListViewControllerDelegate?
    
    init(model: [Episode]){
        self.model = model
        super.init(nibName: nil, bundle: nil)
        title = "Episodes"
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let noticationCenter = NotificationCenter.default
        noticationCenter.addObserver(self,selector:#selector(seasonDidChange),name:Notification.Name(SEASON_DID_CHANGE_NOTIFICATION_NAME),object: nil)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        let noticationCenter = NotificationCenter.default
        noticationCenter.removeObserver(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Notification
    @objc func seasonDidChange(notification: Notification){
        
        guard let info = notification.userInfo else { return }
        
        let season = info[SEASON_KEY] as? Season!
        model = season!.sortedEpisodes

        self.tableView?.reloadData()
      
        
    }
    


}
extension EpisodeListViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "EpisodeCell"
        
        // Descubrir la persona que tenemos que mostrar
        let episode = model[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellId)
        
        // Sicronizar celda y persona
        cell.textLabel?.text = episode.title
        
        // Devolver la celda
        return cell
    }
}


extension EpisodeListViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
        let episode = model[indexPath.row]
        let episodeDetailVC = EpisodeDetailViewController(model: episode)
        navigationController?.pushViewController(episodeDetailVC, animated: true)

        delegate?.EpisodeListViewController(self,didSelectEpisode:episode)
        
        
    }
}
