require 'rubygems'
require 'hpricot'

module Gattica
  class Profiles
    include Convertible
    
    attr_reader :id, :updated, :title, :table_id, :account_id, :account_name,
                :profile_id, :web_property_id, :goals

  
    def initialize(xml)
      @id = xml.at(:id).inner_html
      @updated = DateTime.parse(xml.at(:updated).inner_html)
      @account_id = xml.at("dxp:property[@name='ga:accountId']").attributes['value'].to_i
      @account_name = xml.at("dxp:property[@name='ga:accountName']").attributes['value']

      @title = xml.at("dxp:property[@name='ga:profileName']").attributes['value']
      @table_id = xml.at("dxp:property[@name='dxp:tableId']").attributes['value']
      @profile_id = xml.at("dxp:property[@name='ga:profileId']").attributes['value'].to_i
      @web_property_id = xml.at("dxp:property[@name='ga:webPropertyId']").attributes['value']

      # @goals = xml.search('ga:goal').collect do |goal| {
      #   :active => goal.attributes['active'],
      #   :name => goal.attributes['name'],
      #   :number => goal.attributes['number'].to_i,
      #   :value => goal.attributes['value'].to_f,
      # }
      # end
    end
    
  end
end
