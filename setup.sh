mkdir -p data
mkdir -p logs
mkdir -p import
mkdir -p plugins

data_folder=$(pwd)/data
logs_folder=$(pwd)/logs
import_folder=$(pwd)/import
plugins_folder=$(pwd)/plugins

docker run -itd -v $data_folder:/var/lib/neo4j/data \
-v $logs_folder:/var/lib/neo4j/logs \
-v $import_folder:/var/lib/neo4j/import \
-v $plugins_folder:/var/lib/neo4j/plugins \
-p 7474:7474 -p 7687:7687 --network=my-bridge-network --name=neo4j neo4j-img

# docker exec -it hadoop-master /usr/local/spark/bin/pyspark --conf spark.neo4j.bolt.password=test --conf spark.neo4j.bolt.url='bolt://neo4j:7687' --conf spark.neo4j.bolt.user=neo4j --packages neo4j-contrib:neo4j-spark-connector:2.4.0-M6,graphframes:graphframes:0.1.0-spark1.6
