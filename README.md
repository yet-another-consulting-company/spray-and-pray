# SPRAY and PRAY
A bash script for sending Kafka messages in bulk with Confluent Cloud CLI. The script takes a topic as input and looks for a directory with that name and procduces one message to the Kafka Topic per file. The file name will be the kafka key and the message payload will be the file contents. The script creates a new key/secret pair for each run and deletes it afterwards.

## Prerequisites 

 * [Confluent CLI](https://docs.confluent.io/confluent-cli/current/install.html)
 * [jq](https://stedolan.github.io/jq/download/)
 * Login w/ Confluent CLI `$ confluent login`


## Produce to Confluent Cloud

#### Without configuration file
`$ ./produce <topic>  <environment> <cluster>`.

Save your message files in one directory per topic like the diagram shows below. The variable `<directory>` should be the path to the directory you want to produce on `<topic>`.

```bash
.
├── produce.sh
├── product
│   ├── 131312.json
│   └── 131313.json
└── order
    ├── e14k4.json
    ├── e2fy8.json
    └── r9e21.json
```

With the example above, the command could look like: `$ ./produce product env-t67q9 lkc-fr90tg` and then message '131312.json' and '131313.json' will be sent on topic 'product'. The keys for these messages will be '131312' and '131313' respectively.


#### With configuration file
`$ ./produce <topic>`. You need to create a configuration file in the working directory called `.spray-and-pray.config` and its content needs to be:

 ```json
{
   "environment":"<environment>",
   "cluster":"<cluster>",
}
``` 

Create a config file in the working directory: 

`$ touch .spray-and-pray.config && echo "{\n  \"environment\":\"<environment>\",\n  \"cluster\":\"<cluster>\",\n  \"directory\":\"<directory>\"\n}" > .spray-and-pray.config`






