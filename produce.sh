#!/bin/bash
printf "\n"
echo "Running script from: https://github.com/yet-another-consulting-company/spray-and-pray"
printf "\n\n"

## ## ## HANDLE ARGUMENTS ## ## ##
topic=""
environment=""
cluster=""

FILE=./.spray-and-pray.config
if test -f "$FILE"; then
    echo "Found configuration file.."
    environment=`jq .environment $FILE | sed 's/\"//g'`
    cluster=`jq .cluster $FILE | sed 's/\"//g'`
fi

if ! [ -z "$1" ]
  then
    topic=$1
fi


if ! [ -z "$3" ]
  then
  environment=$2
fi

if ! [ -z "$3" ]
  then
  $cluster=$3
fi

message_dir=$topic
api_key_description="Local Kafka Produce Script, temporary key - can be removed"

echo "Topic [$topic] Environment [$environment] Cluster [$cluster] Message Directory [$message_dir]"


## ## ## LOGIN TO CONFLUENT ## ## ##
confluent login
confluent environment use $environment
confluent kafka cluster use $cluster
temp_secret=`confluent api-key create --environment $environment --resource $cluster --output json --description "$api_key_description"`
#echo API Key generated: $temp_secret | jq -r '.key'
api_key=`echo $temp_secret | jq -r '.key'`
api_secret=`echo $temp_secret | jq -r '.secret'`

confluent api-key store $api_key $api_secret --resource $cluster

echo "Created API key: " $api_key






## ## ## FIND ALL MESSAGES ## ## ##
echo "Looking for messages in " $message_dir

find $message_dir -type f -name "*.json" -print0 | while read -d $'\0' file
do
	#key=`echo "$file" | sed 's/\.// ' | sed 's/\///' | 's/^\.json//'`
	key=`basename -s .json  $file`
	tmp_value=`cat $file`
	value=${tmp_value//$'\n'/}
	echo "Removed line breaks: $value"
	echo "Sending $key to $topic"
	echo "$key:$value" | confluent kafka topic produce $topic --api-key $api_key --parse-key
done	


## ## ## FLUSH ## ## ##
confluent api-key delete $api_key
