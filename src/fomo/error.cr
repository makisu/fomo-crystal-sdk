class Fomo::Error < Exception
  include JSON::Serializable
  property message : String?
  property success : Bool?
  property error : String?
end
