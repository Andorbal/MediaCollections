class User
  include MongoMapper::Document

  key :name,     String
  many :auth_providers
  timestamps!

  # Validations.
  validates_presence_of :name, :auth_providers

  def self.find_or_create_from_auth_hash(auth_hash)
    user = User.first("auth_providers.hash" => auth_hash.uid,
                      "auth_providers.provider" => auth_hash.provider)
    user || User.create(name: auth_hash.info.name,
                        auth_providers: [AuthProvider.new(hash: auth_hash.uid,
                                                          provider: auth_hash.provider)])

  end
end