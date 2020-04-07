require File.dirname(__FILE__) + '/../helper'

describe Namecheap::Domains do
  it 'should initialize' do
    Namecheap::Domains.new
  end

  it 'should be already initialized from the Namecheap namespace' do
    Namecheap.domains.should_not be_nil
  end
  
  it 'should search' do
    Namecheap.configure do |config|
      config.key = 'nc-key'
      config.username = 'nc-username'
      config.client_ip = 'client-ip'
      config.proxy_url = 'proxy-url'
      config.proxy_port = 'proxy-port'
      config.proxy_user = 'proxy-user'
      config.proxy_password = 'proxy-pass'
  
    end
  end
end
