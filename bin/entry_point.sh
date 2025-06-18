#!/bin/bash

# Activate the conda environment
source /Users/chaudhari.ha/miniforge3/bin/activate jekyll-project

# Add ImageMagick and Jupyter paths to PATH
export PATH="/Users/chaudhari.ha/miniforge3/envs/jekyll-project/bin:$PATH"

CONFIG_FILE=_config.yml 

/bin/bash -c "rm -f Gemfile.lock && exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&

while true; do

  inotifywait -q -e modify,move,create,delete $CONFIG_FILE

  if [ $? -eq 0 ]; then
 
    echo "Change detected to $CONFIG_FILE, restarting Jekyll"

    jekyll_pid=$(pgrep -f jekyll)
    kill -KILL $jekyll_pid

    /bin/bash -c "rm -f Gemfile.lock && exec jekyll serve --watch --port=8080 --host=0.0.0.0 --livereload --verbose --trace --force_polling"&

  fi

done
