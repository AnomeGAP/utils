#!/bin/sh

# do scala 2.10 release
mvn -Dresume=false release:clean release:prepare release:perform

# do scala 2.11 release
./scripts/move_to_scala_2.11.sh
git commit -a -m "Modifying pom.xml files for 2.11 release."
mvn -Dresume=false release:clean release:prepare release:perform

# move back to 2.10 for development
./scripts/move_to_scala_2.10.sh
git commit -a -m "Modifying pom.xml files to move back to Scala 2.10 for development."
