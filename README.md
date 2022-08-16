# SPRAY and PRAY
A bash script for sending Kafka messages in bulk with Confluent Cloud CLI.

## Prerequisites 

 * [Confluent CLI](https://docs.confluent.io/confluent-cli/current/install.html)
 * jq with [Homebrew](https://formulae.brew.sh/formula/jq) or APT for Linux
 * Login w/ Confluent CLI `$ confluent login`


## Produce to Confluent Cloud

##### With configuration file
`$ ./produce <topic>`. You need to create a configuration file in the working directory called `.spray-and-pray.config` and its content needs to be:

 ```json
{
   "environment":"<environment>",
   "cluster":"<cluster>",
   "directory":"<directory>"
}
``` 
##### Without configuration file
`$ ./produce <topic> <directory> <environment> <cluster>`.





