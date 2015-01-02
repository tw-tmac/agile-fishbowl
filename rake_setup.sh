#!/bin/sh
 
RAILS_ROOT=$(cd `dirname $0`/.. && pwd)
 
unset GEM_HOME
unset GEM_PATH
 
export GEM_HOME=$RAILS_ROOT/vendor
export GEM_PATH=$GEM_HOME
export PATH=$GEM_HOME/bin:$PATH
 
mkdir -p $GEM_HOME
 
cd $RAILS_ROOT
 
gem install sinatra dm-core dm-migrations dm-types dm-aggregates