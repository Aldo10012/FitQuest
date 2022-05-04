//
//  NewGoalViewModel.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import Foundation

struct TypeListItem: Hashable {
    let displayName: String
    let typeName: String
}

class NewGoalViewModel: ObservableObject {
    @Published var selectedDisplay: String = "" {
        didSet {
            setupGoalLabel()
        }
    }
    @Published var selectedType: String = "" {
        didSet {
            setupGoalLabel()
        }
    }
    @Published var selectedDifficulty: String = "" {
        didSet {
            setupGoalLabel()
        }
    }
    
    @Published var yourGoal: String = "Your Goal: N/A"
    
    let typeList: [TypeListItem] = [        
        TypeListItem(displayName: "Exercise Time",   typeName: "appleExerciseTime"),
        TypeListItem(displayName: "Step Count",      typeName: "stepCount"),
        TypeListItem(displayName: "Walking/Running", typeName: "distanceWalkingRunning"),
        TypeListItem(displayName: "Cycling",         typeName: "distanceCycling"),
        TypeListItem(displayName: "Flights Climbed", typeName: "flightsClimbed")
    ]
    
    let difficultyList: [String] = [
        "Trivial",
        "Easy",
        "Normal",
        "Hard"
    ]
    
    func setupGoalLabel() {
        yourGoal = GoalCreater().createGoalLabel(type: selectedType, difficulty: selectedDifficulty)
    }
    
    func addNewGoal() {
        let realmService = RealmService.shared
        realmService.createNewGoal(
            display: selectedDisplay,
            type: selectedType,
            difficulty: selectedDifficulty
        )
    }
}
