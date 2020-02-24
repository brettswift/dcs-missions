#!/usr/bin/env bash
#########################################
# Due to the nature of missions being saved as zip fles
# this script will unpack it so we get diffs. It may 
# be of little use but it helps determine if unwanted changes happen
# .. it likely won't help a merge scenario.
##########################################

# to add media to the missions, run this command: <tbd>

# put all missions here.
unzip -o DCS-22.5.6/MP-Caucus-Anapa.miz -d DCS-22.5.6/MP-Caucus-Anapa/