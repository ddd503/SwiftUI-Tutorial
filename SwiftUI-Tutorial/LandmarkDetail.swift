//
//  LandmarkDetail.swift
//  SwiftUI-Tutorial
//
//  Created by kawaharadai on 2020/06/27.
//  Copyright © 2020 kawaharadai. All rights reserved.
//

import SwiftUI

struct LandmarkDetail: View {
    @EnvironmentObject var userData: UserData
    var landmark: Landmark

    var landmarkIndex: Int {
        userData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        VStack {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300) // widthの指定なしなら横幅いっぱいになる
                .edgesIgnoringSafeArea(.top) // SafeAreaを詰める(無視する)

            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) { // 縦並べ
                Text(landmark.name)
                    .font(.title)
                HStack { // 横並べ
                    Text(landmark.park)
                        .font(.subheadline)
                    Spacer() // 横とのスペース
                    Text(landmark.state)
                        .font(.subheadline)
                }
            }
                .padding() // 四方にスペース

            Spacer() // 膨張スペースを入れて全体を上へ詰める
        }
        .navigationBarTitle(Text(landmark.name), displayMode: .inline)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
    }
}
