## CRYSTAL AMQP

A sample app that shows how to connect to RabbitMQ, subscribe to a queue and replay the data to another exchange.

### What you are not going to find (yet)

* Real unit testing
* Lint strategy or any code analysis
* CI/CD
* Any kind of automation

### What you are going to find:

* A simple Crystal app working with RabbitMQ over AMQP protocol;
* A dockerized RabbitMQ ready to run on your local using docker;

### Building the app

1. open a terminal;
2. install all dependencies running the command `shards install` or just `shards`;
3. to make sur ethe app is "ok", run `crystal spec`. It should end with no errors;
4. build the app: `crystal build src/crystal-amqp.cr`. You should see an executbale file in the root folder called "crystal-amqp";

### Running the app (and requirements)

1. First, run rabbitmq using docker: `docker-compose up`;
2. To check fi everything is ok, access RabbitMQ management console open the following url: `http://localhost:15672`. The username and the password are "guest";
3. Run the app: `./crystal-amqp`
4. The app should create 2 exchanges (data.in and data.out) and 1 queue)
5. Everything published to "data.in" is going to be routed to a queue and "processed" by the app to be republished on "data.out" exchange. No data transformation is expected.

This app was built with the intent of testing the crystal basic capabilities with RabbitMQ to route messages nad check memory foot print and CPU usage when working with a very high ingress data scenario. Obviously, all of it with no optimization or any kind of connection management inteligence in the app. THis is a very basic test just to see how it behaves.


