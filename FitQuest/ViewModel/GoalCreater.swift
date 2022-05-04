//
//  GoalCreater.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import Foundation

class GoalCreater {
    func createGoalLabel(type: String, difficulty: String) -> String {
        switch type {
        case "appleExerciseTime":
            switch difficulty {
            case "Trivial": return "Exercise for 15 min"
            case "Easy":    return "Exercise for 30 min"
            case "Normal":  return "Exercise for 45 min"
            case "Hard":    return "Exercise for 60 min"
            default: break
            }
        case "stepCount":
            switch difficulty {
            case "Trivial": return "Walk 2.5k steps"
            case "Easy":    return "Walk 5k steps"
            case "Normal":  return "Walk 7.5k steps"
            case "Hard":    return "Walk 10k steps"
            default: break
            }
        case "distanceWalkingRunning":
            switch difficulty {
            case "Trivial": return "Walk/run 1.25 miles"
            case "Easy":    return "Walk/run 2.5 miles"
            case "Normal":  return "Walk/run 3.75 miles"
            case "Hard":    return "Walk/run 5 miles"
            default: break
            }
        case "distanceCycling":
            switch difficulty {
            case "Trivial": return "Cycle 2.5 miles"
            case "Easy":    return "Cycle 5 miles"
            case "Normal":  return "Cycle 7.5 miles"
            case "Hard":    return "Cycle 10 miles"
            default: break
            }
        case "flightsClimbed": 
            switch difficulty {
            case "Trivial": return "Climb 5 floors"
            case "Easy":    return "Climb 10 floors"
            case "Normal":  return "Climb 15 floors"
            case "Hard":    return "Climb 20 floors"
            default: break
            }
        default:
            break
        }
        
        return "Your Goal: N/A"
    }
}
