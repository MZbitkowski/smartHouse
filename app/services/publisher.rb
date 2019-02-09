class Publisher
  def self.publish(device_topic, group_topic, message = {})
    #topic can be group in here
    x = channel.topic("home", :auto_delete => true)
    x.publish(message, :routing_key => "#{device_topic}.#{group_topic}")
  end

  def self.channel
    @channel ||= connection.create_channel
  end

  # The `Bunny.new(...)` is a place to put any specific RabbitMQ settings
  def self.connection
    @connection ||= Bunny.new.tap do |c|
      c.start
    end
  end
end