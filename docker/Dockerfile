FROM cloudfoundrylondon/bbr-pipeline:final

RUN \
  apt-get update && \
  apt-get install -y apt-transport-https && \
  wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | sudo apt-key add - &&\
  echo 'deb http://packages.cloudfoundry.org/debian stable main' | tee /etc/apt/sources.list.d/cloudfoundry-cli.list && \
  apt-get update && \
  apt-get install -y ruby-full build-essential cf-cli && \
  gem install aws-sdk cf-uaac --no-ri --no-rdoc && \
  rm -rf /var/lib/apt/lists/*
