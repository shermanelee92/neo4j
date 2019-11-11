# neo4j
This works with https://github.com/shermanelee92/hadoop-spark-hive with jupyter notebook

## Getting Started
First build the image

`docker build -t neo4j-img .`

Then run `./setup.sh`

Go to `http://localhost:7474/browser/` you should see the neo4j browser

If your container stopped running, run `./startup.sh`


## Incorporating with Jupyter notebook

In order to connect to neo4j you need the below code (it contains a code sample also)
Basically you need the driver's session to run a query

```
from neo4j import GraphDatabase

uri = "bolt://neo4j:7687"
driver = GraphDatabase.driver(uri, auth=("neo4j", "test"))

cqlNodeQuery = "MATCH (x:university) RETURN x"
nodes = driver.session().run(cqlNodeQuery)

for node in nodes:
    print(node)
