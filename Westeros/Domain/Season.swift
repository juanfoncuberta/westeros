//
//  Season.swift
//  Westeros
//
//  Created by Juan Foncuberta on 24/2/18.
//  Copyright © 2018 Juan Foncuberta. All rights reserved.
//

import UIKit

//MARK: - Typealisas
typealias Episodes = Set<Episode>

//MARK: - Class
final class Season{
    
    let name: String
    let releaseDate:Date
    private var _episodes: Episodes
    
    init(name:String, releaseDate:Date, episode: Episode) {
        self.name = name
        self.releaseDate = releaseDate
        _episodes = Episodes()
        self.add(episode: episode)
    }
    
}


extension Season{
    
    func add(episode:Episode){
        _episodes.insert(episode)
    }
    
    func convertDateToString(date:Date)->String{
        let formatter = DateFormatter()
        return formatter.string(from: date)
    }
    
    var count:Int{
        return _episodes.count
    }
    
}

//MARK: - CustomStringConvertible
extension Season: CustomStringConvertible{
    var description: String {
        return "\(name), \(convertDateToString(date:releaseDate)), \(_episodes.count)"
    }
}
//MARK: - Hashable

extension Season:Hashable{
    var hashValue: Int{
        return proxyForEquiality.hashValue
    }
}

//MARK: - Proxy
extension Season{
    var proxyForEquiality: String{
        return "\(name) \(releaseDate)"
    }
    
    var proxyForComparison: Date{
        return releaseDate
    }
    
    
}

//MARK: - Equatable
extension Season: Equatable{
    static func ==(lhs:Season, rhs:Season)->Bool{
        return lhs.proxyForEquiality == rhs.proxyForEquiality
    }
}

//MARK:-Comparable
extension Season: Comparable{
    static func <(lhs:Season,rhs:Season)->Bool{
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
}

