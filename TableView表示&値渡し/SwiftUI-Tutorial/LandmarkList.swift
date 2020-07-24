//
//  LandmarkList.swift
//  SwiftUI-Tutorial
//
//  Created by kawaharadai on 2020/06/28.
//  Copyright © 2020 kawaharadai. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    @EnvironmentObject var userData: UserData

    var body: some View {
        NavigationView { // embed in navigation
            // TableView表示
            List {
                // スイッチタイプのセル生成
                Toggle(isOn: $userData.showFavoritesOnly) {
                    Text("Favorites only")
                }
                // 同タイプ(userData.landmarks)セルの連続生成（showFavoritesOnlyバインディングされている？）
                ForEach(userData.landmarks) { landmark in
                    if !self.userData.showFavoritesOnly || landmark.isFavorite {
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group { // 複数端末でpreview見る
            ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (12.9-inch)"], id: \.self) { deviceName in
                LandmarkList()
                    .environmentObject(UserData())
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
    }
}
