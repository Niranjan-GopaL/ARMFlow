#Author: Bhargav D V, Research Scholar, IIITB, under guidance of Prof. Madhav Rao.
#This script is used to create folders for given design

#!/bin/bash

mkdir ../circuits/$1

mkdir ../evolution/$1/
mkdir ../evolution/$1/$2/
mkdir ../evolution/$1/$2/$3/


mkdir ../executionTime/$1/
mkdir ../executionTime/$1/$2/
mkdir ../executionTime/$1/$2/$3/


mkdir ../fitness/$1
mkdir ../fitness/$1/$2/
mkdir ../fitness/$1/$2/$3/


mkdir ../metrics/$1/
mkdir ../metrics/$1/$2/
mkdir ../metrics/$1/$2/$3/



mkdir ../circuits/$1/
mkdir ../circuits/$1/$2/
mkdir ../circuits/$1/$2/$3/


mkdir ../plots/$1/
mkdir ../plots/$1/$2/
mkdir ../plots/$1/$2/$3/

mkdir ../fitnessPlots/$1/
mkdir ../fitnessPlots/$1/$2/
mkdir ../fitnessPlots/$1/$2/$3/




echo "Done!"