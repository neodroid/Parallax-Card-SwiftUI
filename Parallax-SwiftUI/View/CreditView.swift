//
//  CreditView.swift
//  Parallax-SwiftUI
//
//  Created by Kevin ahmad on 17/07/22.
//

import SwiftUI

struct CreditView: View {
    var body: some View {
        VStack{
            HStack(spacing: 0) {
                Text("github/")
                    .padding(.top,20)
                    .font(.system(size: 24, weight: .light, design: .rounded))
                .foregroundColor(Color(hex: "EAF0E7"))
                Text("neodroid")
                    .padding(.top,20)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color(hex: "EAF0E7"))
            }
            HStack(spacing: 0) {
                Text("twitter/")
                    .padding(.top,5)
                    .font(.system(size: 24, weight: .light, design: .rounded))
                .foregroundColor(Color(hex: "EAF0E7"))
                Text("kevinahmad")
                    .padding(.top,5)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .foregroundColor(Color(hex: "EAF0E7"))
            }
        }
    }
}

struct CreditView_Previews: PreviewProvider {
    static var previews: some View {
        CreditView()
    }
}
