pushd jboss-eap
docker build -t jboss-eap-7.0 .
popd

pushd atg-11.3
docker build -t atg-11.3 .
popd