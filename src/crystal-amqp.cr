require "amqp-client"

module Crystal::Amqp
  VERSION = "0.1.0"

  AMQP::Client.start("") do |c|
    c.channel do |ch2|
      c.channel do |ch|
        # routing setup
        ch.queue_declare(name: "local-crystal-processor", passive: false, durable: true)
        ch.exchange_declare("data.in", type: "topic")
        ch.exchange_declare("data.out", type: "direct")
        ch.queue_bind("local-crystal-processor", "data.in", "")
        ch.prefetch(count: 500) # alias for basic_qos

        # consuming
        q = ch.queue("local-crystal-processor")
        q.subscribe(no_ack: false, block: true) do |msg|
          ch2.basic_publish msg.body_io, exchange: "data.out", routing_key: msg.routing_key
          ch.basic_ack(msg.delivery_tag)
        end
      end
    end
  end 
end
