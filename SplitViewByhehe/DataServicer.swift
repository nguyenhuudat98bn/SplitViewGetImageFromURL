//
//  DataServicer.swift
//  SplitViewByhehe
//
//  Created by nguyễn hữu đạt on 6/1/18.
//  Copyright © 2018 nguyễn hữu đạt. All rights reserved.
//

import UIKit
class DataService {
    static let share : DataService = DataService()
    private var _nyc: [Model]?
    var nyc :[Model]{
        set{
            _nyc = newValue
        }
        get {
            if _nyc == nil {
                getData()
            }
            return _nyc ?? []
        }
    }
    func getData(){
        _nyc = []
        let nyc1 = Model(data: "hehe11", photo: "http://hanoimoi.com.vn/Uploads/maichi/2015/9/28/1280px-Mount_Everest_as_seen_from_Drukair2_PLW_edit.jpg")
        let nyc2 = Model(data: "hihi", photo: "http://streaming1.danviet.vn/upload/4-2016/images/2016-10-10/147608135456731-jang-mi-16.jpg")
        _nyc = [nyc1,nyc2]
        
    }
    
}
