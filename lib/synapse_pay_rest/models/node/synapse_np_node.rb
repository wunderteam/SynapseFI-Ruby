module SynapsePayRest
  class SynapseNpNode < SynapseNode
    class << self
      def payload_for_create(nickname:, **options)
        args = {
          type: 'SYNAPSE-NP',
          nickname: nickname
        }.merge(options)
        payload = super(args)
        # optional payload fields
        extra = {}
        extra['supp_id']            = options[:supp_id] if options[:supp_id]
        extra['gateway_restricted'] = options[:gateway_restricted] if options[:gateway_restricted]
        payload['extra'] = extra if extra.any?
        payload
      end
    end
  end
end
