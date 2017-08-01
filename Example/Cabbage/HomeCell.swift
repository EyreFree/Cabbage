//
//  HomeCell.swift
//  Cabbage
//
//  Created by EyreFree on 2017/8/1.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import Cabbage

class HomeCell: UITableViewCell, CabbageTableViewCell, CabbageReuse {

    var model: CabbageModel?

    required init(style: UITableViewCellStyle, model: CabbageTableViewCellModel?) {
        super.init(style: style, reuseIdentifier: model?.reuseIdentifier())

        self.textLabel?.font = UIFont.systemFont(ofSize: 24)
    }

    func setModel(with: CabbageModel) {
        self.textLabel?.text = (with as? HomeCellModel)?.title
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
