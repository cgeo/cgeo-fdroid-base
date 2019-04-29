#! /bin/bash

if [ -z "$JENKINS_NODE_NAME" ]; then
  JENKINS_NODE_NAME_FILE=${JENKINS_NODE_NAME_FILE:-/srv/slave}
  JENKINS_NODE_NAME=$(cat $JENKINS_NODE_NAME_FILE)
fi
if [ -z "$JENKINS_NODE_SECRET" ]; then
  JENKINS_NODE_SECRET_FILE=${JENKINS_NODE_SECRET_FILE:-/srv/secret}
  JENKINS_NODE_SECRET=$(cat $JENKINS_NODE_SECRET_FILE)
fi

if [ -z "$JENKINS_NODE_NAME" -o -z "$secret" ]; then
  echo "No credentials detected. Please check README for the ways to provide them." 2> /dev/null
  exit 1
fi

java -jar /apk/slave.jar -jnlpUrl http://ci.cgeo.org/computer/$JENKINS_NODE_NAME/slave-agent.jnlp -secret $JENKINS_NODE_SECRET
