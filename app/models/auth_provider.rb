class AuthProvider
  include MongoMapper::EmbeddedDocument

  key :provider, String
  key :hash, String
end