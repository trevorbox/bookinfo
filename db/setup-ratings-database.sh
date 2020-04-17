#!/bin/bash

#Using Ingress IP Self-Service: read https://docs.openshift.com/container-platform/3.3/dev_guide/getting_traffic_into_cluster.html#using-ingress-IP-self-service

MONGO_ADMIN_PASSWORD=redhat
BOOKINFO_PASSWORD=redhat

MONGODB_HOST=a6ed930fe446a4853a4f719ee8725eb6-1940319882.us-east-2.elb.amazonaws.com
MONGODB_PORT=27017

cat <<EOF | mongo $MONGODB_HOST:$MONGODB_PORT -u admin -p $MONGO_ADMIN_PASSWORD --authenticationDatabase admin
use test
db.createUser(
   {
     user: "bookinfo",
     pwd: "$BOOKINFO_PASSWORD",
     roles: [ "read"]
   }
);
EOF

cat <<EOF | mongo $MONGODB_HOST:$MONGODB_PORT -u admin -p $MONGO_ADMIN_PASSWORD --authenticationDatabase admin
use test
db.createCollection("ratings");
db.ratings.insert(
  [{rating: 1},
   {rating: 1}]
);
EOF

cat <<EOF | mongo $MONGODB_HOST:$MONGODB_PORT -u bookinfo -p $BOOKINFO_PASSWORD --authenticationDatabase test
use test
db.ratings.find({});
EOF




