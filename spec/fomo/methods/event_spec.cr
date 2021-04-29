require "../../spec_helper"
require "debug"

describe Fomo::Event do
  it "creates an event" do
    WebMock.stub(:post, "https://api.fomo.com/api/v1/applications/me/events")
      .to_return(status: 200, body: File.read("spec/support/create_event.json"), headers: {"Content-Type" => "application/json"})

      event = Fomo::Event.create_event(event_type_id: 123, external_id: "adf23r" )
      event.id.should eq(1)
  end

  it "retrieves an event" do
    WebMock.stub(:get, "https://api.fomo.com/api/v1/applications/me/events/1")
      .to_return(status: 200, body: File.read("spec/support/retrieve_event.json"), headers: {"Content-Type" => "application/json"})

    event = Fomo::Event.retrieve_event(1)
    event.id.should eq(1)
  end

  it "deletes an event" do
    WebMock.stub(:delete, "https://api.fomo.com/api/v1/applications/me/events/1")
      .to_return(status: 200, body: File.read("spec/support/delete_event.json"), headers: {"Content-Type" => "application/json"})

    event = Fomo::Event.delete(1)
    event.message.should eq("Event successfully deleted")
  end

  it "updates an event" do
    WebMock.stub(:patch, "https://api.fomo.com/api/v1/applications/me/events/123")
      .to_return(status: 200, body: File.read("spec/support/update_event.json"), headers: {"Content-Type" => "application/json"})

    event = Fomo::Event.update_event(event_type_id: 123, first_name: "John")
    event.event_type_id.should eq(123)
  end

  it "searches an event using email address" do
    WebMock.stub(:get, "https://api.fomo.com/api/v1/applications/me/events/find?field=email_address&q=john@fomo.com")
      .to_return(status: 200, body: File.read("spec/support/update_event.json"), headers: {"Content-Type" => "application/json"})

    event = Fomo::Event.search_event(field: "email_address", q: "john@fomo.com")
    event.id.should eq(1)
  end

  it "searches an event using external id" do
    WebMock.stub(:get, "https://api.fomo.com/api/v1/applications/me/events/find?field=external_id&q=fdsa23423")
      .to_return(status: 200, body: File.read("spec/support/update_event.json"), headers: {"Content-Type" => "application/json"})

    event = Fomo::Event.search_event(field: "external_id", q: "fdsa23423")
    event.id.should eq(1)
  end

  it "retrieves all events" do
    WebMock.stub(:get, "https://api.fomo.com/api/v1/applications/me/events?per=30&page=1")
    .to_return(status: 200, body: File.read("spec/support/retrieve_events.json"), headers: {"Content-Type" => "application/json"})

    event_list = Fomo::Event.retrieve_events(30, 1)
    event_list.events[0].id.should eq(1)
    event_list.events[1].id.should eq(9438552)

  end

  it "retrieves all events with meta included" do

    WebMock.stub(:get, "https://api.fomo.com/api/v1/applications/me/events?per=30&page=1&show_meta=true")
    .to_return(status: 200, body: File.read("spec/support/retrieve_events_with_meta.json"), headers: {"Content-Type" => "application/json"})

    event_list = Fomo::Event.retrieve_events_with_meta(30, 1)
    event_list.size.should eq(2)
    event_list.events[0].id.should eq(1)
    event_list.events[1].id.should eq(9438552)
    puts event_list.meta.per_page.should eq (10)
  end

end
