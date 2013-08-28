require 'namecheap/api'

module Namecheap
  class Ssl < Api
    # Activates a newly purchased SSL certificate.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:activate
    def activate(id, options = {})
      options = {:CertificateID => id}.merge(options)
      get 'ssl.activate', options
    end

    # Retrieves information about the requested SSL certificate.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:getinfo
    def get_info(id, options = {})
      options = {:CertificateID => id}.merge(options)
      get 'ssl.getInfo', options
    end

    # Parsers the CSR.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:parsecsr
    def parse_csr(csr, options = {})
      options = {:csr => csr}.merge(options)
      get 'ssl.parseCSR', options
    end

    # Gets approver email list for the requested domain.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:getapproveremaillist
    def get_approver_email_list(domain, options = {})
      options = {:DomainName => domain}.merge(options)
      get 'ssl.getApproverEmailList', options
    end

    # Returns a list of SSL certificates for a particular user.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:getlist
    def get_list(options = {})
      get 'ssl.getList', options
    end

    # Creates a new SSL certificate.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:create
    def create(options = {})
      get 'ssl.create', options
    end

    # Renews an SSL certificate.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:renew
    def renew(options = {})
      get 'ssl.renew', options
    end

    # Resends the approver email.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:resendapproveremail
    def resend_approver_email(id, options = {})
      options = {:CertificateID => id}.merge(options)
      get 'ssl.resendApproverEmail', options
    end

    # Resends the fulfilment email containing the certificate.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:resendfulfillmentemail
    def resend_fulfillment_email(id, options = {})
      options = {:CertificateID => id}.merge(options)
      get 'ssl.resendfulfillmentemail', options
    end

    # Reissues an SSL certificate.
    # @see http://developer.namecheap.com/docs/doku.php?id=api-reference:ssl:reissue
    def reissue(id, options = {})
      options = {:CertificateID => id}.merge(options)
      get 'ssl.reissue', options
    end
  end
end
