class Fomo::Meta
  include JSON::Serializable

  getter per_page : Int32
  getter page : Int32
  getter total_count : Int32
  getter total_pages : Int32

end



