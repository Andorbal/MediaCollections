MongoMapper.connection = Mongo::Connection.new('localhost', 27017) unless Rails.env == :production
MongoMapper.connection = Mongo::Connection.new(ENV["MC_MONGO_URL"], ENV["MC_MONGO_PORT"]) if Rails.env == :production
MongoMapper.database = "MediaCollections-#{Rails.env}"

if defined?(PhusionPassenger)
  PhusionPassenger.on_event(:starting_worker_process) do |forked|
    MongoMapper.connection.connect if forked
  end
end