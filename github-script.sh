#!/bin/bash
#set -x

rm -rf moquiprod
echo "download from repository"
##git clone https://github.com/xolvegroup/moquiprod.git moquiprod && cd moquiprod
./gradlew getComponent -Pcomponent=HiveMind
./gradlew downloadOpenSearch
cd runtime/component
git clone git@github.com:xolvegroup/xolve-theme.git
git clone https://github.com/xolvegroup/WorkManagement.git
git clone https://github.com/xolvegroup/Sales.git
cd runtime/lib/
wget https://jdbc.postgresql.org/download/postgresql-42.2.9.jar
cd ../..
./gradlew build
#./gradlew load
./gradlew addRuntime
echo "Path for current"
pwd
ls -lart
unzip -n moqui-plus-runtime.war
