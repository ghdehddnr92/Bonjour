//
//  MyData.swift
//  HelloTrip
//
//  Created by dong wook on 2017. 12. 19..
//  Copyright © 2017년 SSU. All rights reserved.
//

import Foundation

class MyData{
    let flags : [String] = ["ad","ae","af","ag","al","am","ao","ar","at","au","az","ba","bb","bd","be","bf","bg","bh","bi","bj","bn","bo","br","bs","bt","bw","by","bz","ca","cd","cf","cg","ch","ci","cl","cm","cn","co","cr","cu","cv","cy","cz","de","dj","dk","dm","do","dz","ec","ee","eg","eh","er","es","et","fi","fj","fm","fr","ga","gb","gd","ge","gh","gm","gn","gq","gr","gt","gw","gy","hn","hr","ht","hu","id","ie","il","in","iq","ir","is","it","jm","jo","jp","ke","kg","kh","ki","km","kn","kp","kr","ks","kw","kz","la","lb","lc","li","lk","lr","ls","lt","lu","lv","ly","ma","mc","md","me","mg","mh","mk","ml","mm","mn,","mr","mt","mu","mv","mw","mx","my","mz","na","ne","ng","ni","nl","no","np","nr","nz","om","pa","pe","pg","ph","pk","pl","pt","pw","py","qa","ro","rs","ru","rw","sa","sb","sc","sd","se","sg","si","sk","sl","sm","sn","so","sr","st","sv","sy","sz","td","tg","th","tj","tl","tm","tn","to","tr","tt","tv","tw","tz","ua","ug","us","uy","uz","va","vc","ve","vn","vu","ws","ye","za","zm","zw"]
    
    
    class var Container : MyData{
        struct Static{
            static let flags = MyData()
        }
        return Static.flags
}
}
