//
//  ContentView.swift
//  TamagotchiApp
//
//  Created by Rakesh Bahadur on 22/01/2021.
//

import SwiftUI

struct ContentView: View {
    @State var tam = Tamagotchi(name: "Gareth")
    // @State var statusDisplay: String = "Welcome"
    
    @State var ageTime: Int = 10 {
        didSet {
            if ageTime == 0 {
                tam.increaseAge()

                ageTime = 10
                
                if tam.age == tam.deathAge {
                    tam.die()
                    tam.statusDisplay = "\(tam.name) has just died of old age"
                }
            }
        }
    }
    
    @State var illTime = 30 {
        didSet {
            if illTime == 0 && tam.isIll == true {
                tam.die()
                tam.statusDisplay = "\(tam.name) has died of illness"
            }
        }
    }
    
    @State var dirtyTime = 10 {
        didSet {
            if dirtyTime == 0 && tam.isDirty == true {
                tam.fallIll()
            }
        }
    }
    
    @State var bathroomTime = Int.random(in: 15...30) {
        didSet {
            if bathroomTime == 0 {
                tam.goToBathroom()
                dirtyTime = 10
                bathroomTime = Int.random(in: 15...30)
            }
        }
    }
    
    @State var heartLostTime = 25 {
        didSet {
            if heartLostTime == 0 {
                
                if tam.happy == 0 || tam.hunger == 0 {
                    tam.die()
                    tam.statusDisplay = "\(tam.name) has died of neglect"
                } else {
                    tam.happy -= 1
                    tam.hunger -= 1
                    heartLostTime = 25
                }
            }
        }
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        
        VStack {
                        
            Section {
            
                Text("Tamagotchi").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            }
            
                    
            Form {
                
                Section {
                
                    Text(tam.statusDisplay)
                
                }
                
                VStack (spacing: 20)  {
                    Text("\(tam.displayStats())")
                        .onReceive(timer, perform: { _ in
                            if !tam.isDead {
                                ageTime -= 1
                                bathroomTime -= 1
                                heartLostTime -= 1
                                
                                if tam.isDirty == true {
                                    dirtyTime -= 1
                                }
                                
                                if tam.isIll == true {
                                    illTime -= 1
                                }
                            }
                            
                        })
                }
            
            }
                
            Section() {
                
                HStack(spacing: 20, content: {
                    Button("Feed Meal", action: {
                        tam.feedMeal()
                    } ).disabled(tam.isDead)
                    
                    Button("Feed Snack", action: {
                        tam.feedSnack()
                    } ).disabled(tam.isDead)
                    
                    Button("Play Game", action: {
                        tam.playGame()
                    } ).disabled(tam.isDead)
                
                }).padding()
                
                HStack(spacing: 20, content: {
                    Button("Clean Up", action: {
                        tam.cleanUp()
                    } )
                    .disabled(!tam.isDirty || tam.isDead)
                
                    Button("Give Medicine", action: {
                        //
                        tam.giveMedicine()
                    } )
                    .disabled(!tam.isIll || tam.isDead)
                    
                    
                }).padding()
                
                HStack(spacing: 20, content: {
                    Button("Reset", action: {
                        tam.reset()
                    } )
                    .disabled(!tam.isDead)
                    
                }).padding()
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
