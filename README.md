# Bulky-Boy
Bash script for sending Kafka messages in bulk to Confluent Cloud CLI.

## Prerequisites

 * [Confluent CLI](https://docs.confluent.io/confluent-cli/current/install.html)
 * jq with [Homebrew](https://formulae.brew.sh/formula/jq) or APT for Linux
 
## Optional Configuration file
If you create a configuration file, you don't need to send in cluster, environment and directory every time you produce:

`$ touch .bulky-boy.config && echo "{\r\n   \"topic\":\"\",\r\n   \"environment\":\"\",\r\n   \"cluster\":\"\",\r\n   \"directory\":\"\"\r\n}" > .bulky-boy.config`

## Produce to Confluent Cloud

#### Without configuration file
`$ ./produce <directory> <topic> <environment> <cluster>`.

#### With configuration file


./.bulky-boy-config



