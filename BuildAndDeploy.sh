#!/bin/sh

mvn clean install package

java -jar ./target/*.jar
