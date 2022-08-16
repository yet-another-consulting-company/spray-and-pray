# SPRAY and PRAY
A bash script for sending Kafka messages in bulk with Confluent Cloud CLI.

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
├── topic1
│   ├── msg1.json
│   └── msg2.json
└── topic2
    ├── msg1.json
    ├── msg3.json
    └── msg4.json
```

With the example above, the command could look like: 

#### Without configuration file
`$ ./produce topic1 topic1  env-t67q9 lkc-fr90tg`


#### With configuration file
`$ ./produce <topic>`. You need to create a configuration file in the working directory called `.spray-and-pray.config` and its content needs to be:

 ```json
{
   "environment":"<environment>",
   "cluster":"<cluster>",
   "directory":"<directory>"
}
``` 






