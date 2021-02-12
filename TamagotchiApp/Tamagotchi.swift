//
//  Tamagotchi.swift
//  TamagotchiApp
//
//  Created by Rakesh Bahadur on 22/01/2021.
//

import Foundation

struct Tamagotchi {
    
    // variables: isDirty, bathroomTime, isDead,
    // funcs: goToBathroom (set timer for illness),
    
    var statusDisplay = "Welcome!"
    
    let name: String
    
    var deathAge = Int.random(in: 50...60)
    
    var age: Int = 0
    
    var weight: Int = 10 {
        didSet {
            if weight <= 5 {
                hunger -= 1
                happy -= 1
                weight = 5
                
                
            } else if weight >= 40 {
                die()
                statusDisplay = "\(name) has died of neglect"

            }
        }
    }
    // max 4 for both
    
    var hunger: Int = 3 {
        didSet {
            if hunger > 4 {
                hunger = 4
            } else if hunger <= 0 {
                hunger = 0
                die()
                statusDisplay = "\(name) has died of hunger"
            }
        }
    }
    
    var happy: Int = 3 {
        didSet {
            if happy > 4 {
                happy = 4
            } else if happy <= 0 {
                happy = 0
                die()
                statusDisplay = "\(name) has died of neglect"
            }
        }
    }
    
    var isIll = false
    
    var isDirty = false
    
    var isDead = false
    
    func displayStats() -> String {
        return("Name: \(name)\nAge: \(age)\nWeight: \(weight)\nHappy hearts: \(happy)\nHungry hearts: \(hunger)\nIll: \(isIll)\nDirty: \(isDirty)")
    }
    
    mutating func feedMeal() {
        
        statusDisplay = "That was some nice steak"
        
        hunger = 5
        weight += 1
        
    }
    
    mutating func feedSnack() {
        
        statusDisplay = "That was a god chocolate bar"
        
        happy += 1
        weight += 2
        
    }
    
    mutating func playGame() {
        
        statusDisplay = "That was fun!"
        
        //
        happy += 1
        weight -= 1
        
        
    }
    
    mutating func increaseAge() {
        
        statusDisplay = "\(name) has just aged"
        
        age += 1
        
    }
    
    mutating func fallIll() {
        
        statusDisplay = "\(name) has fallen ill"
        
        isIll = true
        
        // need timer here to eventually die
    }
    
    mutating func giveMedicine() {
        statusDisplay = "\(name) is feeling better!"
        
        isIll = false
        
    }
    
    mutating func goToBathroom() {
        statusDisplay = "\(name) has just gone to the bathroom"
        
        isDirty = true
    }
    
    mutating func cleanUp() {
        statusDisplay = "\(name) is now clean"
        
        isDirty = false
        
    }
    
    mutating func die() {
        isDead = true
        
        statusDisplay = "\(name) has died"
    }
    
    mutating func reset() {
        //
        statusDisplay = "Welcome!"
        
        deathAge = Int.random(in: 50...60)
        
        age = 0
        
        weight = 10
        
        hunger = 3
        
        happy = 3
        
        isIll = false
        
        isDirty = false
        
        isDead = false
        
        
    }
    
}
