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
        List(landmarkData) { (landmark) in
            LandmarkRow(landmark: landmark)
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
