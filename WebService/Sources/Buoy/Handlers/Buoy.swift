import Apodini
import ApodiniHTTP
import ArgumentParser
import DeploymentTargetIoTRuntime
import ApodiniDeploy
import DeploymentTargetIoTRuntime

@main
struct BuoyWebService: WebService {
    @Option(help: "The port the web service is offered at")
    var port: Int = 80

    var configuration: Configuration {
        HTTPConfiguration(port: port)
        HTTP()
        ApodiniDeploy(runtimes: [IoTRuntime<Self>.self])
    }

    var content: some Component {
        Group("sensors") {
            Sensor()
        }.metadata(DeploymentDevice(.default))

        Group("data") {
            SensorData()
        }
    }
}
