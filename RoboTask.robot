*** Settings ***
Documentation  Roboboy goes to gmail and logs in
Resource       resource.robot
Task Template  Search Wikipedia 
Task Teardown  Close Browser

*** Tasks ***           SEARCH
Search For Hitler       Hitler
Search For Dicaprio     Leonardo Dicaprio 
Search for Brad Pitt    Brad Pitt 