class Fomo::Event::List::Meta
  include JSON::Serializable
  include Enumerable(::Fomo::Event)

  getter events : Array(::Fomo::Event)
  getter meta : (::Fomo::Meta)
  def each(&block)
    events.each do |i|
      yield i
    end
  end

end
