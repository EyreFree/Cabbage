
import Cabbage

extension HomeController {
    class lineModel: CabbageTableViewCellModel {
        var name: String?
        var estimatedHeight: CGFloat? = 36
    }

    public struct HomeState: CabbageStateType {
        var nameList = [[lineModel()]]
    }

    public func store() -> CabbageStore<HomeState> {
        return homeStore ?? {
            let newStore = CabbageStore<HomeState>(
                reducer: HomeController.counterReducer,
                state: nil
            )
            homeStore = newStore
            return newStore
            }()
    }
}
