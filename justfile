genjsonl:
    mkdir -p tmp
    cat finetune.json | jq -c '.[] \
      | select(.correct == "correct") | {"prompt": .selected, "completion": .result}' \
      > tmp/tune.jsonl
	# this is wrong, need to fix. need to provide both selected and transform as json encoded to prompt

create:
    # https://beta.openai.com/docs/guides/fine-tuning/preparing-your-dataset
    openai api fine_tunes.create -t tmp/tune.jsonl -m davinci
