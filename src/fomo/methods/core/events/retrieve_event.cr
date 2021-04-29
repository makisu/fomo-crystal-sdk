class Fomo::Event
  def self.retrieve_event(id : Int32)
    response = Fomo.client.get("/api/v1/applications/me/events/#{id}")
    if response.status_code == 200
      Event.from_json(response.body)
    else
      raise Error.from_json(response.body, "error")
    end
  end
end
