module Service
  class TestMoip < Generic

    def post_customer(id, url)
      HTTParty.post("#{Settings.url}/#{url}",
                    :body => {:ownId => "#{id}",:fullname => "John Rocha", :email =>  "johnrocha@email.com"}.to_json,
                    :headers => {'Content-Type' => 'application/json', 'Authorization' => 'Basic MEVSVkROMzg2V0UzUlpSSTRZWUc2UUNETE1KNTdMQlI6U1JaR0hSWFlPVDBQVkRMUkIzWUU4WFFXTE5MQTBKUlhUS09JRFZEUQ==' }  )
    end

    def post_order(id, item,  url)
      HTTParty.post("#{Settings.url}/#{url}",
                    :body => {:ownId => "#{id}",items:[:product => "#{item}", :quantity => "1", :detail => "Mais info...", :price =>  "1000"]}.to_json,
                    :headers => {'Content-Type' => 'application/json', 'Authorization' => 'Basic MEVSVkROMzg2V0UzUlpSSTRZWUc2UUNETE1KNTdMQlI6U1JaR0hSWFlPVDBQVkRMUkIzWUU4WFFXTE5MQTBKUlhUS09JRFZEUQ==' }  )
    end

    def post_payment(id, url, order)
      HTTParty.post("#{Settings.url}/#{url}/#{order}/payment",
                    :body => {
                              :installmentCount =>  "1",
                                :fundingInstrument => {
                                    :method => "CREDIT_CARD",
                                  :creditCard => {
                                      :expirationMonth => "05",
                                      :expirationYear => "18",
                                      :number => "5555666677778884",
                                      :cvc => "123",
                                    :holder => {
                                        :fullname => "Jose Portador da Silva",
                                        :birthdate => "1988-12-30",
                                      :taxDocument => {
                                          :type => "CPF",
                                          :number => "33333333333"
                                      },
                                        :phone => {
                                            :countryCode => "55",
                                            :areaCode => "11",
                                            :number => "66778899"
                                        }
                                    }
                                  }
                              }
                            }.to_json,
                    :headers => {'Content-Type' => 'application/json', 'Authorization' => 'Basic MEVSVkROMzg2V0UzUlpSSTRZWUc2UUNETE1KNTdMQlI6U1JaR0hSWFlPVDBQVkRMUkIzWUU4WFFXTE5MQTBKUlhUS09JRFZEUQ==' }  )
    end

    def put(postid, userid, title, body)
      HTTParty.put("#{Settings.url}/posts/#{postid}",
                    :body => {:userId => userid,
                    :title => title,
                    :body => body})
    end

    def get(url)
      HTTParty.get("#{Settings.url}/#{url}")
    end

    def delete_post(id)
      HTTParty.delete("#{Settings.url}/posts/#{id}")
    end
  end
end
