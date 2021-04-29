class Fomo::Event::List
  include JSON::Serializable
  include Enumerable(::Fomo::Event)

  getter events : Array(::Fomo::Event)

  def each(&block)
    events.each do |i|
      yield i
    end
  end
end
