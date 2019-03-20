1.LOAD CSV WITH HEADERS
FROM 'http://ip:port/file.csv'
AS sample
CREATE (entity:Entity{ name: sample.FieldName})

2.To delete all nodes:
MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n, r

3.To match relationship patterns and fetch data from path
MATCH (e:Entity)-[k:DEFINITION]->(d:Definition)
WHERE e.name = 'x'
RETURN k.description,e.description,d.description etc...

1. Counting the number of Vertices (nodes)

   match (n:Professionals)
   return count(n)

2. Counting the number of Edges (relationships)

   match (n:Professionals)-[r]->()
   return count (r)

3. Find number of Vertices and edges 
   MATCH (n) WITH COUNT(n) AS numVertices
   MATCH (a)-[e]->(b)
   RETURN numVertices, COUNT(e) AS numEdges

4. Finding the leaf nodes
   match (n:Professionals)-[r:FRIEND]->(m)
   where not ((m)-->())
   return m

5. Finding the types (Label) of a node:
   match (n)
   where n.Name = 'Robin'
   return labels(n)

6.Create users:
CALL dbms.security.createUser("username", "password", FALSE)
List all users:
CALL dbms.security.listUsers()
Delete a user:
CALL dbms.security.deleteUser(username)

7.Connet two nodes using any relationships

MATCH (m:node1)
MATCH (x:node2)
MERGE (x)-[:CONNECTION]->(m);
