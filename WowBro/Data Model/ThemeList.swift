//
//  ThemeList.swift
//  WowBro
//
//  Created by HyunJoong on 2022/03/17.
//

import Foundation

struct ThemeList {
    let themeUrlString: String
    let themeName: String
}

let themeList = [
    ThemeList(themeUrlString: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQslXDI89y6oVf7HgyFgNaMtsr405B84PhhQg&usqp=CAU", themeName: "양림동"),
    ThemeList(themeUrlString: "https://t1.daumcdn.net/cfile/blog/19298B3F4EF58D5C22", themeName: "운암동"),
    ThemeList(themeUrlString: "https://ifh.cc/g/vgjNVP.jpg", themeName: "서구"),
    ThemeList(themeUrlString: "https://ifh.cc/g/1PwAHC.jpg", themeName: "구도심")
]
