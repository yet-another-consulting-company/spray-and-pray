# SPRAY and PRAY
A bash script for sending Kafka messages in bulk with Confluent Cloud CLI. The script creates a new key/secret pair for each run and deletes it afterwards.

## Prerequisites 

 * [Confluent CLI](https://docs.confluent.io/confluent-cli/current/install.html)
 * [jq](https://stedolan.github.io/jq/download/)
 * Login w/ Confluent CLI `$ confluent login`


## Produce to Confluent Cloud

#### Without configuration file
`$ ./produce <topic> <directory> <environment> <cluster>`.

Save your message files in one directory per topic like the diagram shows below. The variable `<directory>` should be the path to the directory you want to produce on `<topic>`.

```bash
.
├── spray-and-pray.sh
├── products
│   ├── 131312.json
│   └── 131313.json
└── order
    ├── e14k4.json
    ├── e2fy8.json
    └── r9e21.json
```

With the example above, the command could look like: `$ ./produce products products env-t67q9 lkc-fr90tg` and then message '131312.json' and '131313.json' will be sent on topic 'topic1'.


#### With configuration file
`$ ./produce <topic>` or `$ ./produce <topic> <directory>`. You need to create a configuration file in the working directory called `.spray-and-pray.config` and its content needs to be:

 ```json
{
   "environment":"<environment>",
   "cluster":"<cluster>",
   "directory":"<directory>"
}
``` 

Create a config file in the working directory: 

`$ touch .spray-and-pray.config && echo "{\r\n  \"environment\":\"<environment>\",\r\n  \"cluster\":\"<cluster>\",\r\n  \"directory\":\"<directory>\"\r\n}" > .spray-and-pray.config`






