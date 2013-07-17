require 'rubygems'
require 'hpricot'

module Gattica
  class Segment
    include Convertible
    
    attr_reader :id, :name, :definition
  
    def initialize(xml)
      @id = xml.attributes['id']
      @name = xml.attributes['name']
      @definition = xml.at("dxp:definition").inner_html
    end
    
  end
end
