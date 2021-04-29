class Fomo::Event
  def self.search_event(field : String, q : String)
    response = Fomo.client.get("/api/v1/applications/me/events/find?field=#{field}&q=#{q}")
    
    if response.status_code == 200
      Event.from_json(response.body)
    else
      raise Error.from_json(response.body, "error")
    end
  end
end
