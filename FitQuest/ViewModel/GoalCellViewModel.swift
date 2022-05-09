//
//  GoalCellViewModel.swift
//  FitQuest
//
//  Created by Alberto Dominguez on 5/4/22.
//

import Foundation

// TODO: move to another file & create SwiftUI view to go with it
class GoalCellViewModel: ObservableObject {
    
    // MARK: - Properties
    var goal: Goal!
    var healthStat: HealthStat!

    var goalLabel: String!
    var goalStatusLabel: String!
    
    // MARK: - Init
    convenience init(goal: Goal, healthStat: HealthStat) {
        self.init()
        self.goal = goal
        self.healthStat = healthStat

        
        // TODO: clean this up
        var foo: String //= (healthStat.stat != nil) ? "\( Int(healthStat.stat!.doubleValue(for: .count())) )" : "0"
        
        if healthStat.type == "distanceWalkingRunning" || healthStat.type == "distanceCycling" {
            foo = (healthStat.stat != nil) ? "\( Double(healthStat.stat!.doubleValue(for: .mile())).roundToNearestTenth() )" : "0"
        } else {
            foo = (healthStat.stat != nil) ? "\( Int(healthStat.stat!.doubleValue(for: .count())) )" : "0"
        }
        
        let bar = GoalCreater().getGoalFor(type: goal.type, difficulty: goal.difficulty)
        
        self.goalLabel = goal.display
        self.goalStatusLabel = "\(foo) / \(bar)" // ex: Step Count ~ "2,000/5,000 steps"
    }
    
}

extension GoalCellViewModel: Hashable {
    static func == (lhs: GoalCellViewModel, rhs: GoalCellViewModel) -> Bool {
        return lhs.goal == rhs.goal
    }
    
    public var hashValue: Int { // 1
        return "\(goalLabel)".hashValue
    }
}
