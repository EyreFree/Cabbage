
import Foundation

public protocol CabbageTableViewCell: CabbageView {

    init(style: UITableViewCellStyle, model: CabbageTableViewCellModel?)
}

extension CabbageTableViewCell {

    public init(withModel: CabbageModel) {
        self.init(style: .default, model: nil)
    }
}
