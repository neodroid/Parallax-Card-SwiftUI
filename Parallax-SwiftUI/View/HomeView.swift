//
//  HomeView.swift
//  Parallax-SwiftUI
//
//  Created by Kevin ahmad on 16/07/22.
//

import SwiftUI
import CoreMotion

struct HomeView: View {
    
    let motionManager = CMMotionManager()
    let queue = OperationQueue()
    @State private var roll = Double.zero
    
    var body: some View {
        VStack {
            CreditView()
            TabView {
                ForEach(cardDatas){ data in
                    GeometryReader { geo in
                        Image(data.backgroundImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x: -roll * 60)
                            .frame(width: geo.size.width, height: geo.size.height)
                            .clipped()
                        
                        
                        Image(data.frontImage)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .offset(x: roll * 5)
                            .frame(width: geo.size.width, height: geo.size.height)
                            .scaleEffect(1.1)
                            .clipped()
                        
                        HStack{
                            Spacer()
                            Text(data.name)
                                .padding(.top,30)
                                .font(.system(size: 34, weight: .black, design: .rounded))
                                .foregroundColor(Color(hex: "EAF0E7").opacity(0.8))
                                .offset(x: -roll * 20)
                            Spacer()
                        }.padding(.top,30)
                        
                        
                    }
                }
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding(.horizontal,40)
                .padding(.bottom,80)
                .padding(.top, 20)
                .onAppear {
                    self.motionManager.deviceMotionUpdateInterval = 1/60
                    self.motionManager.startDeviceMotionUpdates(to: self.queue) { (data: CMDeviceMotion?, error: Error?) in
                        guard let data = data else {
                            print("Error: \(error!)")
                            return
                        }
                        let attitude: CMAttitude = data.attitude
                        print("roll: \(attitude.roll)")
                        
                        DispatchQueue.main.async {
                            withAnimation(.spring(response: 0.33, dampingFraction: 0.33)) {
                                self.roll = attitude.roll
                            }
                        }
                    }
                }
            }.tabViewStyle(.page)
        }
        .background{
            Rectangle()
                .fill(Color(hex: "252254"))
                .ignoresSafeArea()
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
