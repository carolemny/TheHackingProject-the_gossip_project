class GossipController < ApplicationController
  def list
    @all_gossips = Gossip.all
  end

  def show_gossip
    @gossip = Gossip.find(params["gossip_id"].to_i)
    puts @gossip
  end
end
