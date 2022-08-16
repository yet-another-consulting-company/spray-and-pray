
 _________________  _____   __   ___   _   _______  ____________  _____   __
/  ___| ___ \ ___ \/ _ \ \ / /  / _ \ | \ | |  _  \ | ___ \ ___ \/ _ \ \ / /
\ `--.| |_/ / |_/ / /_\ \ V /  / /_\ \|  \| | | | | | |_/ / |_/ / /_\ \ V / 
 `--. \  __/|    /|  _  |\ /   |  _  || . ` | | | | |  __/|    /|  _  |\ /  
/\__/ / |   | |\ \| | | || |   | | | || |\  | |/ /  | |   | |\ \| | | || |  
\____/\_|   \_| \_\_| |_/\_/   \_| |_/\_| \_/___/   \_|   \_| \_\_| |_/\_/  
                                                                            
                                                                            
A bash script for sending Kafka messages in bulk to Confluent Cloud CLI.

## Prerequisites

 * [Confluent CLI](https://docs.confluent.io/confluent-cli/current/install.html)
 * jq with [Homebrew](https://formulae.brew.sh/formula/jq) or APT for Linux


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





