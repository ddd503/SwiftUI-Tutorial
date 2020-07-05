//
//  LandmarkList.swift
//  SwiftUI-Tutorial
//
//  Created by kawaharadai on 2020/06/28.
//  Copyright © 2020 kawaharadai. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    var body: some View {
        NavigationView { // embed in navigation
            List(landmarkData) { (landmark) in
                NavigationLink(destination: LandmarkDetail(landmark: landmark)) { // 遷移先のView指定
                    LandmarkRow(landmark: landmark) // 表示セル内容
                }
                .navigationBarTitle(Text("Landmarks"))
            }
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        Group { // 複数端末でpreview見る
            ForEach(["iPhone SE", "iPhone XS Max", "iPad Pro (12.9-inch)"], id: \.self) { deviceName in
                LandmarkList()
                    .previewDevice(PreviewDevice(rawValue: deviceName))
                    .previewDisplayName(deviceName)
            }
        }
    }
}
