//
//  NewGoalViewModel.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import Foundation

class NewGoalViewModel: ObservableObject {
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
    
    let typeList: [String] = [
        "Exercise Time",  // "appleExerciseTime"
        "Step Count",     // "stepCount"
        "Distance",       // "distanceWalkingRunning"
        "Cycling",        // "distanceCycling"
        "Flights Climbed" // "flightsClimbed"
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
}
