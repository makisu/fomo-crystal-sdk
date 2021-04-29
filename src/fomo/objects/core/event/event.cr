class Fomo::Event
  include JSON::Serializable

  getter id : Int32
  getter external_id : String?
  getter event_type_id : Int32?
  getter url : String?
  getter first_name : String?
  getter city : String?
  getter country : String?
  getter title : String?
  getter image_url : String?
  getter message : String?
  getter link : String?
  getter custom_event_fields_attributes : String | Array(Fomo::CustomEventFieldsAttributes)?
  getter application_id : Int32?
  @[JSON::Field(converter: Time::EpochConverter)]
  getter created_at_to_seconds_from_epoch : Time?
  getter created_at : Time?
end
