//
//  TamagotchiAppTests.swift
//  TamagotchiAppTests
//
//  Created by Rakesh Bahadur on 22/01/2021.
//

import XCTest

class TamagotchiAppTests: XCTestCase {

    func testTamagotchiInitialisationWorks(){
        let tam = Tamagotchi(name: "Michael")
        
        XCTAssertEqual(tam.name, "Michael")
    }
    
    func testTamagotchiDisplayStatsReturnsCorrectString() {
        let tam = Tamagotchi(name: "Johnny")
        
        let test = ("Name: \(tam.name)\nAge: \(tam.age)\nWeight: \(tam.weight)\nHappy hearts: \(tam.happy)\nHungry hearts: \(tam.hunger)\nIll: \(tam.isIll)\nDirty: \(tam.isDirty)")
        
        XCTAssertEqual(tam.displayStats(), test)
    }
    
    func testTamagotchiFeedMealChangesHunger(){
        var tam = Tamagotchi(name: "Michael")

        
        tam.feedMeal()
        
        XCTAssertEqual(tam.hunger, 4)
    }
    
    func testTamagotchiFeedMealChangesWeight(){
        var tam = Tamagotchi(name: "Gaurav Rai")
        
        let test = tam.weight + 1
        
        tam.feedMeal()
        
        XCTAssertEqual(tam.weight, test)
    }
    
    func testTamagotchiFeedSnackChangesHappiness(){
        var tam = Tamagotchi(name: "Gareth")
        
        let test = tam.happy + 1
        
        tam.feedSnack()
        
        XCTAssertEqual(tam.happy, test)
        
        // 1 to happy 2 to weight
    }
    
    func testTamagotchiFeedSnackChangesWeight(){
        var tam = Tamagotchi(name: "Harold IV of Urnan")
        
        let test = tam.weight + 2
        
        tam.feedSnack()
        
        XCTAssertEqual(tam.weight, test)
    }
    
    func testTamagotchiPlayGameChangesHappiness(){
        var tam = Tamagotchi(name: "Norris")
        
        let test = tam.happy + 1
        
        tam.playGame()
        
        XCTAssertEqual(tam.happy, test)
        
    }
    
    func testTamagotchiPlayGameChangesWeight() {
        var tam = Tamagotchi(name: "Sir Carmichael Michaelson II")
        
        let test = tam.weight - 1
        
        tam.playGame()
        
        XCTAssertEqual(test, tam.weight)
    }
    
    func testTamagotchiIncreaseAgeIncreasesAge() {
        var tam = Tamagotchi(name: "Keith")
        
        let test = tam.age + 1
        
        tam.increaseAge()
        
        XCTAssertEqual(tam.age, test)
    }
    
    func testTamagotchiFallIllWorks() {
        var tam = Tamagotchi(name: "Keith")
        
        tam.isIll = false
        
        tam.fallIll()
                
        XCTAssertEqual(tam.isIll, true)
    }

    func testTamagotchiGiveMedicineWorks() {
        var tam = Tamagotchi(name: "Keith")
        
        tam.isIll = true
        
        tam.giveMedicine()
        
        XCTAssertEqual(tam.isIll, false)
    }

    func testTamagotchiGoToBathroomWorks() {
        var tam = Tamagotchi(name: "Keith")
        
        tam.isDirty = false
        
        tam.goToBathroom()
        
        XCTAssertEqual(tam.isDirty, true)
    }

    func testTamagotchiCleanUpWorks() {
        var tam = Tamagotchi(name: "Keith")
        
        tam.isDirty = true
        
        tam.cleanUp()
        
        XCTAssertEqual(tam.isDirty, false)
    }

    func testTamagotchiDieWorks() {
        var tam = Tamagotchi(name: "Keith")
        
        tam.isDead = false
        
        tam.die()
        
        XCTAssertEqual(tam.isDead, true)
    }
    
    func testTamagotchiResetWorks() {
        var tam = Tamagotchi(name: "Sanjan Vinod Sharma")
        
        tam.age = 3
        tam.weight = 23
        tam.hunger = 2
        tam.happy = 2
        tam.isIll = true
        tam.isDirty = true
        tam.isDead = true
        
        let newTam = Tamagotchi(name: "Krishan Nistaan Sharma")
        
        tam.reset()
        
        XCTAssertEqual(tam.age, newTam.age)
        XCTAssertEqual(tam.weight, newTam.weight)
        XCTAssertEqual(tam.hunger, newTam.hunger)
        XCTAssertEqual(tam.happy, newTam.happy)
        XCTAssertEqual(tam.isIll, newTam.isIll)
        XCTAssertEqual(tam.isDirty, newTam.isDirty)
        XCTAssertEqual(tam.isDead, newTam.isDead)
        
    }


}
