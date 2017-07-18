
import Cabbage

extension HomeController {
    public struct HomeState: CabbageStateType {
        var counter: Int = 0
    }

    public func store() -> CabbageStore<HomeState> {
        struct Holder {
            static let homeStore = CabbageStore<HomeState>(
                reducer: HomeController.counterReducer,
                state: nil
            )
        }
        return Holder.homeStore
    }
}
