FROM rabbitmq:3.8.4-alpine

RUN rabbitmq-plugins enable --offline rabbitmq_management
RUN rabbitmq-plugins enable --offline rabbitmq_shovel rabbitmq_shovel_management

EXPOSE 5672
EXPOSE 15671
EXPOSE 15672