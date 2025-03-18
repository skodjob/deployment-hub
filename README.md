# deployment-hub
Collection of deployment files for projects deployed in our long-running scenario.

## Strimzi
One of the used projects is [Strimzi](https://github.com/strimzi/strimzi-kafka-operator) project.
You can find the examples of our deployment configuration in [strimzi](strimzi) folder.

In our [examples](strimzi) we deploy 2 Strimzi operators to manager Main and Mirror Kafka clusters.
Between the clusters there is a `KafkaMirrorMaker2` established to mirror data from one cluster to another.

Overall we use 3 Kafka clusters:
- `main` cluster with connected producers, consumers, mirror maker, and managed topics via TopicOperator
- `mirror` cluster that receives all data from main cluster, topics are mirrored and not managed by TopicOperator
- `oauth` cluster configured with OAuth authentication and authorization via Keycloak

To simulate production env properly we also deploy [Strimzi Drain Cleaner](strimzi/drain-cleaner) tool for proper Kafka pods migration during OpenShift cluster updates.

__Note that all Kafka clusters are already in KRaft mode.__

## Kroxylicious
We [deploy](streams/kroxylicious) several instances of [Kroxylicious](https://kroxylicious.io/) for demo purposes.
Currently, we have 3 instances connected to different Kafka clusters:
- `kroxy-simple` with just traffic forwarding to `main` Kafka cluster
- `kroxy-filters` with `encryption` and `schema enforcement` filters connected to `main` cluster
- `kroxy-oauth` with `encryption` and `oauthbearer` filters connected to `oauth` cluster

Each Kroxy instance has its own clients to demonstrate functionality of the project.

## StreamsHub Console
The [examples](streams/console) also contains [Console](https://github.com/streamshub/console) deployment that contains connection to all existing Kafka clusters.
To gathering metrics we use internal Prometheus provided by OpenShift.
Instance is also connected to Keycloak instance we have available in our deployment.

## Schema Registry
To make Kroxylicous `schema enforcement` working properly, we need some Schema Registry.
In our examples we use [Apicurio Registry](https://github.com/apicurio/apicurio-registry) version 2.x as version 3.x is not production ready yet.
Examples of simple deployment are available in [streams/schema-registry](streams/schema-registry).

## Debezium
__Note that debezium deployment wasn't revisited for a couple of months and is not updated to latest versions__

Next to Strimzi we also use a deployment of [Debezium](https://debezium.io/). 
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
