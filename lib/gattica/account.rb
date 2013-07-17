module Gattica
  class Account
    include Convertible
    
    attr_reader :id, :updated, :title, :table_id, :account_id, :account_name,
                :profile_id, :web_property_id, :goals
  
    def initialize(xml)
      @id = xml.at("link[@rel='self']").attributes['href']
      @updated = DateTime.parse(xml.at(:updated).inner_html)
      @account_id = find_account_id(xml)

      @title = xpath_value(xml, "dxp:property[@name='ga:profileName']")
      @table_id = xpath_value(xml, "dxp:property[@name='dxp:tableId']")
      @profile_id = find_profile_id(xml)
      @web_property_id = xpath_value(xml, "dxp:property[@name='ga:webPropertyId']")
      @goals = []
    end

    def xpath_value(xml, xpath)
      xml.at(xpath).attributes['value']
    end

    def find_account_id(xml)
      xml.at("dxp:property[@name='ga:accountId']").attributes['value'].to_i
    end

    def find_account_name(xml)
      xml.at("dxp:property[@name='ga:accountName']").attributes['value']
    end

    def find_profile_id(xml)
      xml.at("dxp:property[@name='ga:profileId']").attributes['value'].to_i
    end

    def set_account_name(account_feed_entry)
      if @account_id == find_account_id(account_feed_entry)
        @account_name = find_account_name(account_feed_entry)
      end
    end

    def set_goals(goals_feed_entry)
      if @profile_id == find_profile_id(goals_feed_entry)
        goal = goals_feed_entry.search('ga:goal').first
        @goals.push({
          :active => goal.attributes['active'],
          :name => goal.attributes['name'],
          :number => goal.attributes['number'].to_i,
          :value => goal.attributes['value'].to_f
        })
      end
    end    
  end
end
