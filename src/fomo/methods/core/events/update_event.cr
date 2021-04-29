class Fomo::Event
  def self.update_event(
    event_type_id : Int32,
    external_id : String ? = nil,
    first_name : String ? = nil,
    email_address : String ? = nil,
    ip_address : String ? = nil,
    city : String ? = nil,
    province : String ? = nil,
    country : String ? = nil,
    title : String ? = nil,
    url : String ? = nil,
    image_url : String ? = nil,
    custom_event_fields_attributes : Array(String)? = nil
  ): Event forall T, U
  
    io = IO::Memory.new
    builder = ParamsBuilder.new(io)
    
    {% for x in %w(event_type_id external_id first_name email_address ip_address city province country title url image_url ) %}
    builder.add({{x}}, {{x.id}}) unless {{x.id}}.nil?
  {% end %}


    response = Fomo.client.patch("/api/v1/applications/me/events/#{event_type_id}", form: io.to_s)

    if response.status_code == 200
      Event.from_json(response.body)
    else
      raise Error.from_json(response.body, "error")
    end
  end
  
end
