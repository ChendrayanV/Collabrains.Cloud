targetScope = 'subscription'

resource rg 'Microsoft.Resources/resourceGroups@2021-04-01' = {
  name: 'tobedeleted'
  location: 'northeurope'
  tags: {
    'env': 'development'
    'owner': 'chendrayan venkatesan'
    'costcenter': 'AZ-0001'
  }
}

module LogAnalyticsworkSpace 'modules/az-log-analytics/log-analytics.bicep' = {
  name: 'az-container-app-deloyment'
  scope: resourceGroup(rg.name)
}

module kubeEnvironment 'modules/az-kube-environment/az-kube-environment.bicep' = {
  name: 'kube-deployment'
  params: {
    customerId: LogAnalyticsworkSpace.outputs.customerId
    primarySharedKey: LogAnalyticsworkSpace.outputs.primarySharedKey
  }
  scope: resourceGroup(rg.name)
}

module containerApp 'modules/az-container-app/container-app.bicep' = {
  name: 'tobedel'
  scope: resourceGroup(rg.name)
  params: {
    kubeEnvironmentId: kubeEnvironment.outputs.kubeEnvironmentId
  }
}
