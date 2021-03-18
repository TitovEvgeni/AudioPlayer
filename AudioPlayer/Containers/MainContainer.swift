import Swinject

class MainContainer {
    private var containers: [ContainerProtocol] = []
    let rootContainer: Container = Container()
    
    func register(containers: [ContainerProtocol]) {
        self.containers = containers
        self.containers.forEach { container in
            container.register()
        }
    }
}
