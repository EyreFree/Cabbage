
import Cabbage

extension HomeController {
    public struct ListActionAdd: CabbageAction {
        var newLine: HomeCellModel?
    }
    public struct ListActionClick: CabbageAction {
        var index: Int?
    }
}
