//
//  RealmService.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/2/22.
//

import RealmSwift

class RealmService {
    
    // MARK: - Properties
    
    static let shared = RealmService()
    var realm: Realm?
    
    // MARK: - Init
    
    private init() {
        do {
            self.realm = try Realm()
        } catch {
            realm = nil
        }
        print("FILE PATH:", Realm.Configuration.defaultConfiguration.fileURL)
    }
    
    // MARK: - Methods
    
    // TODO: Update this method when introducing user registration/authentication
    /// get current user
    func getCurrentUser() -> User? {
        guard let realm = realm else {
            return nil
        }
        
        // get all users ~ should be no more than 1
        let allUsers = realm.objects(User.self)
        var currentUser: User!
        
        if allUsers.count == 0 {
            // create new user
            let newUser = User()
            newUser.username = "Bob Booby"
            newUser.email = "fakeName@email.com"
            newUser.setLevel1Stats()
            
            // save to Realm database
            try! realm.write {
                realm.add(newUser)
            }
            
            // set currentUser
            currentUser = newUser
        } else {
            currentUser = allUsers[0]
        }
        
        return currentUser
    }

}
