class Order < ActiveRecord::Base
    #belongs_to :idea
    validates :title, presence: true,
                    length: { minimum: 5 }
                    
    
    serialize :notification_params, Hash
    def paypal_url(return_path)
        values = {
            business: "evelin86js-facilitator@gmail.com",
            cmd: "_xclick",
            upload: 1,
            return: "#{Rails.application.secrets.app_host}#{return_path}",
            invoice: id,
            amount: self.price,
            item_name: self.title,
            item_number: self.id,
            quantity: '1',
            
            notify_url: "#{Rails.application.secrets.app_host}/hook"
        }
        #'http://' + "#{Rails.application.secrets.paypal_host}/cgi-bin/webscr?" + values.to_query
        'https://' + "www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
    end

end
