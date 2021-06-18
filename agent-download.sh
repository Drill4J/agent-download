#!/bin/bash

AGENT_VERSION="latest"
AUTOTEST_AGENT_VERSION="latest"
rm -rf data/*
cd data || exit
if [ $AGENT_VERSION = "latest" ]
then
  response=$(wget -qO- "https://drill4j.jfrog.io/artifactory/api/search/latestVersion?g=com.epam.drill&a=drill-agent-linuxX64&v=+")
  export AGENT_VERSION=${response}
fi
wget -c https://drill4j.jfrog.io/artifactory/drill/com/epam/drill/drill-agent-linuxX64/"$AGENT_VERSION"/drill-agent-linuxX64-"$AGENT_VERSION".zip
unzip -o drill-agent-linuxX64-"$AGENT_VERSION".zip
mv linuxX64-"$AGENT_VERSION" agent
rm drill-agent-linuxX64-"$AGENT_VERSION".zip
if [ $AUTOTEST_AGENT_VERSION = "latest" ]
then
  response=$(wget -qO- "https://drill4j.jfrog.io/artifactory/api/search/latestVersion?g=com.epam.drill.autotest&a=autoTestAgent-linuxX64&v=+")
  export AUTOTEST_AGENT_VERSION=${response}
fi
wget -c https://drill4j.jfrog.io/artifactory/drill/com/epam/drill/autotest/autoTestAgent-linuxX64/"$AUTOTEST_AGENT_VERSION"/autoTestAgent-linuxX64-"$AUTOTEST_AGENT_VERSION".zip
unzip -o autoTestAgent-linuxX64-"$AUTOTEST_AGENT_VERSION".zip
mv linuxX64-"$AUTOTEST_AGENT_VERSION" autotest-agent
rm autoTestAgent-linuxX64-"$AUTOTEST_AGENT_VERSION".zip

while true; do sleep 12 ; echo "foreground"; done
