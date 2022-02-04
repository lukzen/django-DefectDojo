# This script is based on https://docs.securecodebox.io/docs/hooks/defectdojo
# The apikey is taken from the current installation of DefectsDojo http://104.198.134.153/api/key-v2


kubectl create ns defect-dojo
kubectl create secret generic defectdojo-credentials --from-literal="username=admin" --from-literal="apikey=05f5579e9383c745430f4de9078a731b3fa4e72b" -n defect-dojo
helm upgrade --install dd secureCodeBox/persistence-defectdojo --set="defectdojo.url=http://defectdojo-django.defect-dojo.svc.cluster.local" -n defect-dojo --debug
helm upgrade  dd secureCodeBox/persistence-defectdojo --set="defectdojo.url=http://defectdojo-django.defect-dojo.svc.cluster.local" -n defect-dojo --debug


# List of scans deployed so far: kubectl get scantypes
# Install HelmChart (use -n to configure another namespace)
helm upgrade --install nmap secureCodeBox/nmap
# Install HelmChart (use -n to configure another namespace)
helm upgrade --install typo3scan secureCodeBox/typo3scan
helm upgrade --install zap secureCodeBox/zap
# Install HelmChart (use -n to configure another namespace)
helm upgrade --install zap-advanced secureCodeBox/zap-advanced

