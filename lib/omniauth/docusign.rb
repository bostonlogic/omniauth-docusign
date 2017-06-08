require 'omniauth-oauth2'

module Omniauth
  module Strategies
    class Docusign < OmniAuth::Strategies::OAuth2
      option :name, 'docusign'

      option :client_options, {
        :site          => 'https://account.docusign.com',
        :authorize_url => '/oauth/auth',
        :auth_scheme   => :basic_auth
      }

      uid { raw_info['sub'] }

      info do
        prune!(
          name: raw_info['name'],
          email: raw_info['email'],
          first_name: raw_info['given_name'],
          last_name: raw_info['family_name']
        )
      end

      def raw_info
        @raw_info ||= access_token.get("/oauth/userinfo").parsed || {}
      end

      private

      def prune!(hash)
        hash.delete_if do |_, value|
          prune!(value) if value.is_a?(Hash)
          value.nil? || (value.respond_to?(:empty?) && value.empty?)
        end
      end
    end
  end
end
