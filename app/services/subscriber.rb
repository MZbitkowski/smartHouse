class Subscriber
  def self.subscribe(device_topic, group_topic)
    x = channel.topic("home", :auto_delete => true)

    channel.queue("home.#{device_topic}.#{group_topic}").bind(x, :routing_key => "#{device_topic}.#{group_topic}").subscribe do |delivery_info, properties, payload|
      puts "An update for Home: #{payload}, routing key is #{delivery_info.routing_key}"
    end
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  # The `Bunny.new(...)` is a place to put any specific RabbitMQ settings, e.g. Host IP
  def self.connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end
end