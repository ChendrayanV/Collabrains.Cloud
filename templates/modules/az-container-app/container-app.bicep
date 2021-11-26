param kubeEnvironmentId string
resource containerApp 'Microsoft.Web/containerapps@2021-03-01' = {
  name: 'tobedeletechen'
  location: resourceGroup().location
  properties: {
    kubeEnvironmentId : kubeEnvironmentId
    configuration: {
      secrets : [
        
      ]
      registries: [
        
      ]
      ingress: {
        external: true
        targetPort: 3000
      }
    }
    template: {
      containers: {
        image: 'docker.io/chenv/collabrains.cloud:v1.0.3'
        name: 'collabrains'
        command: []
        resources: {
          cpu: '.25'
          memory: '.5Gi'
        }
      }
    }
  }
}
