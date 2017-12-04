require 'active_support/core_ext/string/inflections'

module Namecheap
  class Api
    SANDBOX = 'https://api.sandbox.namecheap.com/xml.response'
    PRODUCTION = 'https://api.namecheap.com/xml.response'
    ENVIRONMENT = defined?(Rails) && Rails.respond_to?(:env) ? Rails.env : (ENV["RACK_ENV"] || 'development')
    ENDPOINT = (ENVIRONMENT == 'production' ? PRODUCTION : SANDBOX)

    def get(command, options = {})
      request 'get', command, options
    end

    def post(command, options = {})
      request 'post', command, options
    end

    def put(command, options = {})
      request 'post', command, options
    end

    def delete(command, options = {})
      request 'post', command, options
    end

    def request(method, command, options = {})
      command = 'namecheap.' + command
      options = init_args.merge(options).merge({:Command => command})
      options.keys.each do |key|
        options[key.to_s.camelize] = options.delete(key)
      end

      case method
      when 'get'
        #raise options.inspect
        # HTTParty.get(ENDPOINT, { :query => options})
        HTTParty.get(ENDPOINT, :query=>options,:http_proxyaddr=>Namecheap.config.proxy_url,:http_proxyport=>Namecheap.config.proxy_port,:http_proxyuser=>Namecheap.config.proxy_user,:http_proxypass=>Namecheap.config.proxy_password)
      when 'post'
        # HTTParty.post(ENDPOINT, { :query => options, :body=>{}})
        HTTParty.post(ENDPOINT, :query=>options,:body=>{},:http_proxyaddr=>Namecheap.config.proxy_url,:http_proxyport=>Namecheap.config.proxy_port,:http_proxyuser=>Namecheap.config.proxy_user,:http_proxypass=>Namecheap.config.proxy_password)
  
        when 'put'
        # HTTParty.put(ENDPOINT, { :query => options})
        HTTParty.put(ENDPOINT, :query=>options,:http_proxyaddr=>Namecheap.config.proxy_url,:http_proxyport=>Namecheap.config.proxy_port,:http_proxyuser=>Namecheap.config.proxy_user,:http_proxypass=>Namecheap.config.proxy_password)
  
        when 'delete'
        HTTParty.delete(ENDPOINT, { :query => options})
        HTTParty.delete(ENDPOINT, :query=>options,:http_proxyaddr=>Namecheap.config.proxy_url,:http_proxyport=>Namecheap.config.proxy_port,:http_proxyuser=>Namecheap.config.proxy_user,:http_proxypass=>Namecheap.config.proxy_password)

      end
    end

    def init_args
      %w(username key client_ip).each do |key|
        if Namecheap.config.key.nil?
          raise Namecheap::Config::RequiredOptionMissing,
            "Configuration parameter missing: #{key}, " +
            "please add it to the Namecheap.configure block"
        end
      end
      options = {
        api_user:  Namecheap.config.username,
        user_name: Namecheap.config.username,
        api_key:   Namecheap.config.key,
        client_ip: Namecheap.config.client_ip
      }
    end
  end
end
