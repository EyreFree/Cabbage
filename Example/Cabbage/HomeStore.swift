
import Cabbage

extension HomeController {
    public struct HomeState: CabbageStateType {
        var counter: Int = 0
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
