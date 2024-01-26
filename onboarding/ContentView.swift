//
//  ContentView.swift
//  onboarding
//
//  Created by Faiz Ma'ruf on 26/01/24.
//  Copyright © 2024 developer-rshb. All rights reserved.
//

import SwiftUI

struct OnBoardingStep {
    let image:String
    let title:String
    let description:String
}
private let onBoardingSteps=[
    OnBoardingStep(image: "Illustration1", title: "Diputar", description: "Description for Step 1 "), OnBoardingStep(image: "Illustration2", title: "Dijilat", description: "Description for Step 2"), OnBoardingStep(image: "Illustration3", title: "Dicelupin", description: "Description for Step 3"),
]
struct ContentView: View {
    @State private var currentStep=0
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: {
                    self.currentStep=onBoardingSteps.count-1
                    print("Tombol diklik! Counter sekarang: \(self.currentStep)")
                }){
                    Text("Skip").padding(16).foregroundColor(.gray)
                }
            }
            TabView(selection: $currentStep){
                ForEach(0..<onBoardingSteps.count){ i in
                    VStack{
                        Image(onBoardingSteps[i].image).resizable().frame(width:250,height: 250)
                        
                        Text(onBoardingSteps[i].title).font(.title).bold()
                        
                        Text(onBoardingSteps[i].description).multilineTextAlignment(.center).padding(.horizontal,32)

                    }
                    .tag(i)
                }
            }
//            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
            Button(action: {
                if(self.currentStep<onBoardingSteps.count-1){
                    self.currentStep+=1
                }else{
                    self.currentStep=0
                }
            }){
                Text(currentStep<onBoardingSteps.count-1 ? "Next":"Get Started")
                    .padding(16).frame(maxWidth:.infinity)
                    .background(Color.blue).cornerRadius(16).padding(.horizontal,16).foregroundColor(.white)
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
