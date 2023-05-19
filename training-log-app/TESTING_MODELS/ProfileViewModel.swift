//
//  ProfileViewModel.swift
//  training-log-app
//
//  Created by Richard Reintal on 14.05.2023.
//

import Foundation


class ProfileViewModel: ObservableObject, AppModel, Codable {
    @Published
    var Username: String
    @Published
    var TotalWorkoutsCount: Int
    @Published
    var TotalVolumeCount: Int
    
    @Published
    var FriendsCount: Int
    
    init(Username: String, TotalWorkoutsCount: Int, TotalVolumeCount: Int, FriendsCount: Int) {
        self.Username = Username
        self.TotalWorkoutsCount = TotalWorkoutsCount
        self.TotalVolumeCount = TotalVolumeCount
        self.FriendsCount = FriendsCount
    }
    
    enum CodingKeys: String, CodingKey {
        case Username = "username"
        case TotalWorkoutsCount = "totalworkoutscount"
        case TotalVolumeCount = "totalvolumecount"
        case FriendsCount = "friendscount"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        Username = try container.decode(String.self, forKey: .Username)
        TotalWorkoutsCount = try container.decode(Int.self, forKey: .TotalWorkoutsCount)
        TotalVolumeCount = try container.decode(Int.self, forKey: .TotalVolumeCount)
        FriendsCount = try container.decode(Int.self, forKey: .FriendsCount)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Username, forKey: .Username)
        try container.encode(TotalWorkoutsCount, forKey: .TotalWorkoutsCount)
        try container.encode(TotalVolumeCount, forKey: .TotalVolumeCount)
        try container.encode(FriendsCount, forKey: .FriendsCount)
    }
}
