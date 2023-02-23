#/bin/bash
rails db:create
rails db:migrate
rails s -p $PORT -b "0.0.0.0"