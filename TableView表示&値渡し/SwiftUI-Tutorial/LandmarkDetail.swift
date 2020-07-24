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
                .edgesIgnoringSafeArea(.top) // SafeAreaを詰める(無視する、基本frameいじる前にやる)
                .frame(height: 300) // widthの指定なしなら横幅いっぱいになる


            CircleImage(image: landmark.image)
                .offset(x: 0, y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) { // 縦並べ
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    // テキスト横にボタン追加
                    Button(action: {
                        self.userData.landmarks[self.landmarkIndex].isFavorite.toggle()
                    }) {
                        // ボタンのlabelに画像をset（条件によって画像変わる、actionの後に都度labelの更新処理が走る）
                        if self.userData.landmarks[self.landmarkIndex].isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(Color.yellow)
                        } else {
                            Image(systemName: "star")
                                .foregroundColor(Color.gray)
                        }
                    }
                }

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
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkDetail(landmark: landmarkData[0])
            .environmentObject(UserData())
            .previewDevice(PreviewDevice(rawValue: "iPhone SE"))
            .previewDisplayName("iPhone SE")
    }
}
