
import Foundation

public protocol CabbageTableViewCell: CabbageView {

    init(style: UITableViewCellStyle, reuseIdentifier: String?, model: CabbageTableViewCellModel)
}
