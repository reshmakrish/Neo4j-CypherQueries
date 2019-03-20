# 1.LOAD CSV WITH HEADERS
FROM 'http://ip:port/file.csv'
AS sample
CREATE (entity:Entity{ name: sample.FieldName})

# 2.To delete all nodes:
MATCH (n) OPTIONAL MATCH (n)-[r]-() DELETE n, r

# 3.To match relationship patterns and fetch data from path
MATCH (e:Entity)-[k:DEFINITION]->(d:Definition)
WHERE e.name = 'x'
RETURN k.description,e.description,d.description etc...

# 4.Counting the number of Vertices (nodes)

   match (n:Types)
   return count(n)

# 5. Count the number of Edges (relationships)

   match (n:x)-[r]->()
   return count (r)

# 6. Find number of Vertices and edges 
   MATCH (n) WITH COUNT(n) AS verNum
   MATCH (a)-[e]->(b)
   RETURN verNum, COUNT(e) AS numEdges

# 7. Find the leaf nodes
   match (n:x)-[r:REL]->(n)
   where not ((m)-->())
   return m

# 8. Finding the types (Label) of a node:
   match (n)
   where n.Name = 'X'
   return labels(n)

# 9.Create users:
CALL dbms.security.createUser("username", "password", FALSE)
List all users:
CALL dbms.security.listUsers()
Delete a user:
CALL dbms.security.deleteUser(username)

# 10.Connet two nodes using any relationships

MATCH (m:node1)
MATCH (x:node2)
MERGE (x)-[:CONNECTION]->(m);

# 11.For deleting specific relationships,
MATCH ()-[p:CONNECTION]->(m:Y)
DELETE p

# 12.delete node,relationships
MATCH (m:node1)-[c:CONNECTION]->(x:node2)
DELETE m -Deletes Node m
DELETE x -deletes node x
delete c -deletes relationship c

# 13.Create a single node
CREATE 
(E:e{fieldname:"e1"}),

# 14.delete all nodes starting from a single node X with a certain relationship name
MATCH (m:X)-[p:CONTAINS]->()
DELETE p

# 15.Delete relationship with id
start r=rel(297) 
DELETE r

# 16.Rename a Node

MATCH (e:Node { Name: 'nodeName' })
SET e.Name = 'newname'
RETURN e

# 17.Fetch all relationships

MATCH (x:Node1)-[:REL]-> (n:entity)
RETURN distinct n.Name

# 18.return all nodes of distinct type
MATCH (n:Type)
RETURN distinct n.name

# 19.returns all entities
MATCH (n:entity)
RETURN distinct n.Name

# 20.Update relationships property
MATCH (x:Node1)-[k:CONFIGURE]->(e:Type{name:'node2'})
SET k.Description = 'fjghjhgjfh'
RETURN x,k,e

# 21.Delete a node by id
MATCH (p:entity) where ID(p)=926
delete p




