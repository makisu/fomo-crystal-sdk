class Fomo::Event
  def self.retrieve_events(size : Int32, page : Int32)
    response = Fomo.client.get("/api/v1/applications/me/events?per=#{size}&page=#{page}")
    if response.status_code == 200
      Event::List.from_json(response.body)
    else
      raise Error.from_json(response.body, "error")
    end
  end
end
