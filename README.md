# sokar
Collection of deployment files for Strimzi operator and its operands.

At first, you should somehow create proper namespaces:
- strimzi-operator
- strimzi-kafka
- strimzi-clients

## cluster-operator
Contains Strimzi install files for cluster operator. 
Those files should be in-sync with Strimzi main branch.

```oc apply -f operators/ -n strimzi-operator```

## metrics
Contains configurations files for Grafana and Prometheus.
It should be used to metrics visualization.

```oc apply -f metrics/ -n strimzi-monitoring```
   
## kafka
Contains Kafka cluster configuration. 
Those configs should be in-sync with with Strimzi main branch with latest version.
The sync will be manual, because automation will be too complex.
It also contains configuration files for KafkaTopics and KafkaUsers.

```oc apply -f kafka/ -n strimzi-kafka```

## kafkaclients
Contains configuration for our clients which will verify that Kafka is working.

```oc apply -f kafkaclients/ -n strimzi-clients```
