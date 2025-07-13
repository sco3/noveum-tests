


for region in us-east-1  ; do 
   uv run run-request-litellm.py $region 2>&1 > run-litellm-$region.log &
done
