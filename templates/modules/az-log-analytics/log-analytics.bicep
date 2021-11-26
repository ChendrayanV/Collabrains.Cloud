param logAnalyticsName string
resource law 'Microsoft.OperationalInsights/workspaces@2020-03-01-preview' = {
  name: logAnalyticsName
  location: resourceGroup().location
  properties: any({
    retentionInDays: 30
    features: {
      searchVersion: 1
    }
    sku: {
      name: 'PerGB2018'
    }
  })
}
output customerId string = law.properties.customerId
output primarySharedKey string = listKeys(law.id,law.apiVersion).primarySharedKey
