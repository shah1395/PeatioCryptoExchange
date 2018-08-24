##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Api < Domain
      class V2010 < Version
        class AccountContext < InstanceContext
          class RecordingContext < InstanceContext
            class AddOnResultContext < InstanceContext
              class PayloadList < ListResource
                ##
                # Initialize the PayloadList
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The unique id of the Account responsible for the
                #   recording.
                # @param [String] reference_sid A 34 character string that uniquely identifies the
                #   recording to which this payload belongs.
                # @param [String] add_on_result_sid A 34 character string that uniquely identifies
                #   this result to which this payload belongs.
                # @return [PayloadList] PayloadList
                def initialize(version, account_sid: nil, reference_sid: nil, add_on_result_sid: nil)
                  super(version)

                  # Path Solution
                  @solution = {
                      account_sid: account_sid,
                      reference_sid: reference_sid,
                      add_on_result_sid: add_on_result_sid
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:reference_sid]}/AddOnResults/#{@solution[:add_on_result_sid]}/Payloads.json"
                end

                ##
                # Lists PayloadInstance records from the API as a list.
                # Unlike stream(), this operation is eager and will load `limit` records into
                # memory before returning.
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit.  Default is no limit
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records.  If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Array] Array of up to limit results
                def list(limit: nil, page_size: nil)
                  self.stream(limit: limit, page_size: page_size).entries
                end

                ##
                # Streams PayloadInstance records from the API as an Enumerable.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                # @param [Integer] limit Upper limit for the number of records to return. stream()
                #    guarantees to never return more than limit. Default is no limit.
                # @param [Integer] page_size Number of records to fetch per request, when
                #    not set will use the default value of 50 records. If no page_size is defined
                #    but a limit is defined, stream() will attempt to read the limit with the most
                #    efficient page size, i.e. min(limit, 1000)
                # @return [Enumerable] Enumerable that will yield up to limit results
                def stream(limit: nil, page_size: nil)
                  limits = @version.read_limits(limit, page_size)

                  page = self.page(page_size: limits[:page_size], )

                  @version.stream(page, limit: limits[:limit], page_limit: limits[:page_limit])
                end

                ##
                # When passed a block, yields PayloadInstance records from the API.
                # This operation lazily loads records as efficiently as possible until the limit
                # is reached.
                def each
                  limits = @version.read_limits

                  page = self.page(page_size: limits[:page_size], )

                  @version.stream(page,
                                  limit: limits[:limit],
                                  page_limit: limits[:page_limit]).each {|x| yield x}
                end

                ##
                # Retrieve a single page of PayloadInstance records from the API.
                # Request is executed immediately.
                # @param [String] page_token PageToken provided by the API
                # @param [Integer] page_number Page Number, this value is simply for client state
                # @param [Integer] page_size Number of records to return, defaults to 50
                # @return [Page] Page of PayloadInstance
                def page(page_token: :unset, page_number: :unset, page_size: :unset)
                  params = Twilio::Values.of({
                      'PageToken' => page_token,
                      'Page' => page_number,
                      'PageSize' => page_size,
                  })
                  response = @version.page(
                      'GET',
                      @uri,
                      params
                  )
                  PayloadPage.new(@version, response, @solution)
                end

                ##
                # Retrieve a single page of PayloadInstance records from the API.
                # Request is executed immediately.
                # @param [String] target_url API-generated URL for the requested results page
                # @return [Page] Page of PayloadInstance
                def get_page(target_url)
                  response = @version.domain.request(
                      'GET',
                      target_url
                  )
                  PayloadPage.new(@version, response, @solution)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '#<Twilio.Api.V2010.PayloadList>'
                end
              end

              class PayloadPage < Page
                ##
                # Initialize the PayloadPage
                # @param [Version] version Version that contains the resource
                # @param [Response] response Response from the API
                # @param [Hash] solution Path solution for the resource
                # @return [PayloadPage] PayloadPage
                def initialize(version, response, solution)
                  super(version, response)

                  # Path Solution
                  @solution = solution
                end

                ##
                # Build an instance of PayloadInstance
                # @param [Hash] payload Payload response from the API
                # @return [PayloadInstance] PayloadInstance
                def get_instance(payload)
                  PayloadInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      reference_sid: @solution[:reference_sid],
                      add_on_result_sid: @solution[:add_on_result_sid],
                  )
                end

                ##
                # Provide a user friendly representation
                def to_s
                  '<Twilio.Api.V2010.PayloadPage>'
                end
              end

              class PayloadContext < InstanceContext
                ##
                # Initialize the PayloadContext
                # @param [Version] version Version that contains the resource
                # @param [String] account_sid The account_sid
                # @param [String] reference_sid The reference_sid
                # @param [String] add_on_result_sid The add_on_result_sid
                # @param [String] sid The paylod Sid that uniquely identifies this resource
                # @return [PayloadContext] PayloadContext
                def initialize(version, account_sid, reference_sid, add_on_result_sid, sid)
                  super(version)

                  # Path Solution
                  @solution = {
                      account_sid: account_sid,
                      reference_sid: reference_sid,
                      add_on_result_sid: add_on_result_sid,
                      sid: sid,
                  }
                  @uri = "/Accounts/#{@solution[:account_sid]}/Recordings/#{@solution[:reference_sid]}/AddOnResults/#{@solution[:add_on_result_sid]}/Payloads/#{@solution[:sid]}.json"
                end

                ##
                # Fetch a PayloadInstance
                # @return [PayloadInstance] Fetched PayloadInstance
                def fetch
                  params = Twilio::Values.of({})

                  payload = @version.fetch(
                      'GET',
                      @uri,
                      params,
                  )

                  PayloadInstance.new(
                      @version,
                      payload,
                      account_sid: @solution[:account_sid],
                      reference_sid: @solution[:reference_sid],
                      add_on_result_sid: @solution[:add_on_result_sid],
                      sid: @solution[:sid],
                  )
                end

                ##
                # Deletes the PayloadInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  @version.delete('delete', @uri)
                end

                ##
                # Provide a user friendly representation
                def to_s
                  context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                  "#<Twilio.Api.V2010.PayloadContext #{context}>"
                end
              end

              class PayloadInstance < InstanceResource
                ##
                # Initialize the PayloadInstance
                # @param [Version] version Version that contains the resource
                # @param [Hash] payload payload that contains response from Twilio
                # @param [String] account_sid The unique id of the Account responsible for the
                #   recording.
                # @param [String] reference_sid A 34 character string that uniquely identifies the
                #   recording to which this payload belongs.
                # @param [String] add_on_result_sid A 34 character string that uniquely identifies
                #   this result to which this payload belongs.
                # @param [String] sid The paylod Sid that uniquely identifies this resource
                # @return [PayloadInstance] PayloadInstance
                def initialize(version, payload, account_sid: nil, reference_sid: nil, add_on_result_sid: nil, sid: nil)
                  super(version)

                  # Marshaled Properties
                  @properties = {
                      'sid' => payload['sid'],
                      'add_on_result_sid' => payload['add_on_result_sid'],
                      'account_sid' => payload['account_sid'],
                      'label' => payload['label'],
                      'add_on_sid' => payload['add_on_sid'],
                      'add_on_configuration_sid' => payload['add_on_configuration_sid'],
                      'content_type' => payload['content_type'],
                      'date_created' => Twilio.deserialize_rfc2822(payload['date_created']),
                      'date_updated' => Twilio.deserialize_rfc2822(payload['date_updated']),
                      'reference_sid' => payload['reference_sid'],
                      'subresource_uris' => payload['subresource_uris'],
                  }

                  # Context
                  @instance_context = nil
                  @params = {
                      'account_sid' => account_sid,
                      'reference_sid' => reference_sid,
                      'add_on_result_sid' => add_on_result_sid,
                      'sid' => sid || @properties['sid'],
                  }
                end

                ##
                # Generate an instance context for the instance, the context is capable of
                # performing various actions.  All instance actions are proxied to the context
                # @return [PayloadContext] PayloadContext for this PayloadInstance
                def context
                  unless @instance_context
                    @instance_context = PayloadContext.new(
                        @version,
                        @params['account_sid'],
                        @params['reference_sid'],
                        @params['add_on_result_sid'],
                        @params['sid'],
                    )
                  end
                  @instance_context
                end

                ##
                # @return [String] A string that uniquely identifies this payload
                def sid
                  @properties['sid']
                end

                ##
                # @return [String] A string that uniquely identifies the result
                def add_on_result_sid
                  @properties['add_on_result_sid']
                end

                ##
                # @return [String] The unique sid that identifies this account
                def account_sid
                  @properties['account_sid']
                end

                ##
                # @return [String] A string that describes the payload.
                def label
                  @properties['label']
                end

                ##
                # @return [String] A string that uniquely identifies the Add-on.
                def add_on_sid
                  @properties['add_on_sid']
                end

                ##
                # @return [String] A string that uniquely identifies the Add-on configuration.
                def add_on_configuration_sid
                  @properties['add_on_configuration_sid']
                end

                ##
                # @return [String] The MIME type of the payload.
                def content_type
                  @properties['content_type']
                end

                ##
                # @return [Time] The date this resource was created
                def date_created
                  @properties['date_created']
                end

                ##
                # @return [Time] The date this resource was last updated
                def date_updated
                  @properties['date_updated']
                end

                ##
                # @return [String] A string that uniquely identifies the recording.
                def reference_sid
                  @properties['reference_sid']
                end

                ##
                # @return [String] The subresource_uris
                def subresource_uris
                  @properties['subresource_uris']
                end

                ##
                # Fetch a PayloadInstance
                # @return [PayloadInstance] Fetched PayloadInstance
                def fetch
                  context.fetch
                end

                ##
                # Deletes the PayloadInstance
                # @return [Boolean] true if delete succeeds, true otherwise
                def delete
                  context.delete
                end

                ##
                # Provide a user friendly representation
                def to_s
                  values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.PayloadInstance #{values}>"
                end

                ##
                # Provide a detailed, user friendly representation
                def inspect
                  values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                  "<Twilio.Api.V2010.PayloadInstance #{values}>"
                end
              end
            end
          end
        end
      end
    end
  end
end