import Swinject

protocol ContainerProtocol {
    var mainContainer: MainContainer { get }
    init(mainContainer: MainContainer)
    func register()
}

extension ContainerProtocol {
    var rootContainer: Container {
        return mainContainer.rootContainer
    }
}
