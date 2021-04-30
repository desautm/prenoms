## Test environments
* local Windows install, R 4.0.5
* ubuntu 16.04.6 (on travis-ci), R 4.0.2

## R CMD check results
There were no ERRORs or WARNINGs or NOTEs. 

## Fix for resubmit
* Changed links to the used webservices to the description field of your DESCRIPTION file in the form <http:...> or <https:...> with angle brackets for auto-linking and no space after 'http:' and 'https:'. I don't know if I did the right thing, I added angle brackets in the URL field.
* The examples take less than 5 seconds to compile so I got rid of \dontrun{}
* Added Suggests field in DESCRIPTION to run the examples.
