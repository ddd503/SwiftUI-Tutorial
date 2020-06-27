//
//  ContentView.swift
//  SwiftUI-Tutorial
//
//  Created by kawaharadai on 2019/06/22.
//  Copyright © 2019 kawaharadai. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    var body: some View {
        VStack(alignment: .leading) { // 縦並べ
            Text("Tartle Rock")
                .font(.title)
            HStack { // 横並べ
                Text("Joshua Tree National Park")
                    .font(.subheadline)
                Spacer() // 横とのスペース
                Text("California")
                    .font(.subheadline)
            }
        }
        .padding() // 四方にスペース
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
