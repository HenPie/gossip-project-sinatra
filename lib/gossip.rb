class Gossip

  attr_accessor :author, :content

  def initialize(gossip_author, gossip_content)
    @author = gossip_author
    @content = gossip_content
  end

  def save
    CSV.open("db/gossip.csv", "ab") {|csv| csv << [@author, @content]}
  end

  def self.all
    all_gossips = [] #on initiale un array vide

    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips
  end

  def self.find(id)
  i = 0
    CSV.read('./db/gossip.csv').each do |csv_line|
        puts csv_line if i == id
        i += 1
    end
  end

end