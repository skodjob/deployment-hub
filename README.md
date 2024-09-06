# deployment-hub
Collection of deployment files for projects deployed in our long-running scenario.

## Strimzi
One of the used projects is [Strimzi](https://github.com/strimzi/strimzi-kafka-operator) project.
You can find the examples of our deployment configuration in [strimzi](strimzi) folder.

In our example we deploy 2 Strimzi operators to manager Main and Mirror Kafka clusters.
Between the clusters there is a KafkaMirrorMaker2 established to mirror data from one cluster to another.

## Debezium
Next to Strimziw e also use a deployment of [Debezium](https://debezium.io/). 
Debezium is here used as a load generator from databases into Kafka.
Databases are filled with data from static generator.

## Monitoring & Logging
Every deployment and application is monitored by Prometheus and Vector. 
Because the most of the monitoring stack is deployed from [automation-hub](https://github.com/skodjob/automation-hub) we are not storing the deployment files here.
However, you can find there the example dashboards for the projects and our custom ones for proper monitoring of deployed scenario.

As part of our monitoring stack we use:
- Prometheus
- Grafana
- Thanos
- Loki
- Vector

## Open Data Hub
TODO

