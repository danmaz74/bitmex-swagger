=begin
#BitMEX API

### REST API for the BitMEX Trading Platform  [View Changelog](/app/apiChangelog)    #### Getting Started   ##### Fetching Data  All REST endpoints are documented below. You can try out any query right from this interface.  Most table queries accept `count`, `start`, and `reverse` params. Set `reverse=true` to get rows newest-first.  Additional documentation regarding filters, timestamps, and authentication is available in [the main API documentation](https://www.bitmex.com/app/restAPI).  *All* table data is available via the [Websocket](/app/wsAPI). We highly recommend using the socket if you want to have the quickest possible data without being subject to ratelimits.  ##### Return Types  By default, all data is returned as JSON. Send `?_format=csv` to get CSV data or `?_format=xml` to get XML data.  ##### Trade Data Queries  *This is only a small subset of what is available, to get you started.*  Fill in the parameters and click the `Try it out!` button to try any of these queries.  * [Pricing Data](#!/Quote/Quote_get)  * [Trade Data](#!/Trade/Trade_get)  * [OrderBook Data](#!/OrderBook/OrderBook_getL2)  * [Settlement Data](#!/Settlement/Settlement_get)  * [Exchange Statistics](#!/Stats/Stats_history)  Every function of the BitMEX.com platform is exposed here and documented. Many more functions are available.  ##### Swagger Specification  [⇩ Download Swagger JSON](swagger.json)    ## All API Endpoints  Click to expand a section. 

OpenAPI spec version: 1.2.0
Contact: support@bitmex.com
Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.3.0-SNAPSHOT

=end

require "uri"

module SwaggerClient
  class InstrumentApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end

    # Get instruments.
    # This returns all instruments and indices, including those that have settled or are unlisted. Use this endpoint if you want to query for individual instruments or use a complex filter. Use `/instrument/active` to return active instruments, or use a filter like `{\"state\": \"Open\"}`.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :symbol Instrument symbol. Send a bare series (e.g. XBU) to get data for the nearest expiring contract in that series.  You can also send a timeframe, e.g. &#x60;XBU:monthly&#x60;. Timeframes are &#x60;daily&#x60;, &#x60;weekly&#x60;, &#x60;monthly&#x60;, &#x60;quarterly&#x60;, and &#x60;biquarterly&#x60;.
    # @option opts [String] :filter Generic table filter. Send JSON key/value pairs, such as &#x60;{\&quot;key\&quot;: \&quot;value\&quot;}&#x60;. You can key on individual fields, and do more advanced querying on timestamps. See the [Timestamp Docs](https://www.bitmex.com/app/restAPI#timestamp-filters) for more details.
    # @option opts [String] :columns Array of column names to fetch. If omitted, will return all columns.  Note that this method will always return item keys, even when not specified, so you may receive more columns that you expect.
    # @option opts [Float] :count Number of results to fetch. (default to 100)
    # @option opts [Float] :start Starting point for results. (default to 0)
    # @option opts [BOOLEAN] :reverse If true, will sort results newest first. (default to false)
    # @option opts [DateTime] :start_time Starting date filter for results.
    # @option opts [DateTime] :end_time Ending date filter for results.
    # @return [Array<Instrument>]
    def instrument_get(opts = {})
      data, _status_code, _headers = instrument_get_with_http_info(opts)
      return data
    end

    # Get instruments.
    # This returns all instruments and indices, including those that have settled or are unlisted. Use this endpoint if you want to query for individual instruments or use a complex filter. Use &#x60;/instrument/active&#x60; to return active instruments, or use a filter like &#x60;{\&quot;state\&quot;: \&quot;Open\&quot;}&#x60;.
    # @param [Hash] opts the optional parameters
    # @option opts [String] :symbol Instrument symbol. Send a bare series (e.g. XBU) to get data for the nearest expiring contract in that series.  You can also send a timeframe, e.g. &#x60;XBU:monthly&#x60;. Timeframes are &#x60;daily&#x60;, &#x60;weekly&#x60;, &#x60;monthly&#x60;, &#x60;quarterly&#x60;, and &#x60;biquarterly&#x60;.
    # @option opts [String] :filter Generic table filter. Send JSON key/value pairs, such as &#x60;{\&quot;key\&quot;: \&quot;value\&quot;}&#x60;. You can key on individual fields, and do more advanced querying on timestamps. See the [Timestamp Docs](https://www.bitmex.com/app/restAPI#timestamp-filters) for more details.
    # @option opts [String] :columns Array of column names to fetch. If omitted, will return all columns.  Note that this method will always return item keys, even when not specified, so you may receive more columns that you expect.
    # @option opts [Float] :count Number of results to fetch.
    # @option opts [Float] :start Starting point for results.
    # @option opts [BOOLEAN] :reverse If true, will sort results newest first.
    # @option opts [DateTime] :start_time Starting date filter for results.
    # @option opts [DateTime] :end_time Ending date filter for results.
    # @return [Array<(Array<Instrument>, Fixnum, Hash)>] Array<Instrument> data, response status code and response headers
    def instrument_get_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InstrumentApi.instrument_get ..."
      end
      # resource path
      local_var_path = "/instrument"

      # query parameters
      query_params = {}
      query_params[:'symbol'] = opts[:'symbol'] if !opts[:'symbol'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'columns'] = opts[:'columns'] if !opts[:'columns'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'start'] = opts[:'start'] if !opts[:'start'].nil?
      query_params[:'reverse'] = opts[:'reverse'] if !opts[:'reverse'].nil?
      query_params[:'startTime'] = opts[:'start_time'] if !opts[:'start_time'].nil?
      query_params[:'endTime'] = opts[:'end_time'] if !opts[:'end_time'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml', 'text/xml', 'application/javascript', 'text/javascript'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = form_params
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<Instrument>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstrumentApi#instrument_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all active instruments and instruments that have expired in <24hrs.
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<Instrument>]
    def instrument_get_active(opts = {})
      data, _status_code, _headers = instrument_get_active_with_http_info(opts)
      return data
    end

    # Get all active instruments and instruments that have expired in &lt;24hrs.
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<Instrument>, Fixnum, Hash)>] Array<Instrument> data, response status code and response headers
    def instrument_get_active_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InstrumentApi.instrument_get_active ..."
      end
      # resource path
      local_var_path = "/instrument/active"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml', 'text/xml', 'application/javascript', 'text/javascript'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = form_params
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<Instrument>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstrumentApi#instrument_get_active\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Helper method. Gets all active instruments and all indices. This is a join of the result of /indices and /active.
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<Instrument>]
    def instrument_get_active_and_indices(opts = {})
      data, _status_code, _headers = instrument_get_active_and_indices_with_http_info(opts)
      return data
    end

    # Helper method. Gets all active instruments and all indices. This is a join of the result of /indices and /active.
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<Instrument>, Fixnum, Hash)>] Array<Instrument> data, response status code and response headers
    def instrument_get_active_and_indices_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InstrumentApi.instrument_get_active_and_indices ..."
      end
      # resource path
      local_var_path = "/instrument/activeAndIndices"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml', 'text/xml', 'application/javascript', 'text/javascript'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = form_params
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<Instrument>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstrumentApi#instrument_get_active_and_indices\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Return all active contract series and interval pairs.
    # This endpoint is useful for determining which pairs are live. It returns two arrays of   strings. The first is intervals, such as `[\"BVOL:daily\", \"BVOL:weekly\", \"XBU:daily\", \"XBU:monthly\", ...]`. These identifiers are usable in any query's `symbol` param. The second array is the current resolution of these intervals. Results are mapped at the same index.
    # @param [Hash] opts the optional parameters
    # @return [InstrumentInterval]
    def instrument_get_active_intervals(opts = {})
      data, _status_code, _headers = instrument_get_active_intervals_with_http_info(opts)
      return data
    end

    # Return all active contract series and interval pairs.
    # This endpoint is useful for determining which pairs are live. It returns two arrays of   strings. The first is intervals, such as &#x60;[\&quot;BVOL:daily\&quot;, \&quot;BVOL:weekly\&quot;, \&quot;XBU:daily\&quot;, \&quot;XBU:monthly\&quot;, ...]&#x60;. These identifiers are usable in any query&#39;s &#x60;symbol&#x60; param. The second array is the current resolution of these intervals. Results are mapped at the same index.
    # @param [Hash] opts the optional parameters
    # @return [Array<(InstrumentInterval, Fixnum, Hash)>] InstrumentInterval data, response status code and response headers
    def instrument_get_active_intervals_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InstrumentApi.instrument_get_active_intervals ..."
      end
      # resource path
      local_var_path = "/instrument/activeIntervals"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml', 'text/xml', 'application/javascript', 'text/javascript'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = form_params
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'InstrumentInterval')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstrumentApi#instrument_get_active_intervals\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Show constituent parts of an index.
    # Composite indices are built from multiple external price sources.  Use this endpoint to get the underlying prices of an index. For example, send a `symbol` of `.XBT` to get the ticks and weights of the constituent exchanges that build the \".XBT\" index.  A tick with reference `\"BMI\"` and weight `null` is the composite index tick. 
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :account 
    # @option opts [String] :symbol The composite index symbol. (default to .XBT)
    # @option opts [String] :filter Generic table filter. Send JSON key/value pairs, such as &#x60;{\&quot;key\&quot;: \&quot;value\&quot;}&#x60;. You can key on individual fields, and do more advanced querying on timestamps. See the [Timestamp Docs](https://www.bitmex.com/app/restAPI#timestamp-filters) for more details.
    # @option opts [String] :columns Array of column names to fetch. If omitted, will return all columns.  Note that this method will always return item keys, even when not specified, so you may receive more columns that you expect.
    # @option opts [Float] :count Number of results to fetch. (default to 100)
    # @option opts [Float] :start Starting point for results. (default to 0)
    # @option opts [BOOLEAN] :reverse If true, will sort results newest first. (default to false)
    # @option opts [DateTime] :start_time Starting date filter for results.
    # @option opts [DateTime] :end_time Ending date filter for results.
    # @return [Array<IndexComposite>]
    def instrument_get_composite_index(opts = {})
      data, _status_code, _headers = instrument_get_composite_index_with_http_info(opts)
      return data
    end

    # Show constituent parts of an index.
    # Composite indices are built from multiple external price sources.  Use this endpoint to get the underlying prices of an index. For example, send a &#x60;symbol&#x60; of &#x60;.XBT&#x60; to get the ticks and weights of the constituent exchanges that build the \&quot;.XBT\&quot; index.  A tick with reference &#x60;\&quot;BMI\&quot;&#x60; and weight &#x60;null&#x60; is the composite index tick. 
    # @param [Hash] opts the optional parameters
    # @option opts [Float] :account 
    # @option opts [String] :symbol The composite index symbol.
    # @option opts [String] :filter Generic table filter. Send JSON key/value pairs, such as &#x60;{\&quot;key\&quot;: \&quot;value\&quot;}&#x60;. You can key on individual fields, and do more advanced querying on timestamps. See the [Timestamp Docs](https://www.bitmex.com/app/restAPI#timestamp-filters) for more details.
    # @option opts [String] :columns Array of column names to fetch. If omitted, will return all columns.  Note that this method will always return item keys, even when not specified, so you may receive more columns that you expect.
    # @option opts [Float] :count Number of results to fetch.
    # @option opts [Float] :start Starting point for results.
    # @option opts [BOOLEAN] :reverse If true, will sort results newest first.
    # @option opts [DateTime] :start_time Starting date filter for results.
    # @option opts [DateTime] :end_time Ending date filter for results.
    # @return [Array<(Array<IndexComposite>, Fixnum, Hash)>] Array<IndexComposite> data, response status code and response headers
    def instrument_get_composite_index_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InstrumentApi.instrument_get_composite_index ..."
      end
      # resource path
      local_var_path = "/instrument/compositeIndex"

      # query parameters
      query_params = {}
      query_params[:'account'] = opts[:'account'] if !opts[:'account'].nil?
      query_params[:'symbol'] = opts[:'symbol'] if !opts[:'symbol'].nil?
      query_params[:'filter'] = opts[:'filter'] if !opts[:'filter'].nil?
      query_params[:'columns'] = opts[:'columns'] if !opts[:'columns'].nil?
      query_params[:'count'] = opts[:'count'] if !opts[:'count'].nil?
      query_params[:'start'] = opts[:'start'] if !opts[:'start'].nil?
      query_params[:'reverse'] = opts[:'reverse'] if !opts[:'reverse'].nil?
      query_params[:'startTime'] = opts[:'start_time'] if !opts[:'start_time'].nil?
      query_params[:'endTime'] = opts[:'end_time'] if !opts[:'end_time'].nil?

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml', 'text/xml', 'application/javascript', 'text/javascript'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = form_params
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<IndexComposite>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstrumentApi#instrument_get_composite_index\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # Get all price indices.
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<Instrument>]
    def instrument_get_indices(opts = {})
      data, _status_code, _headers = instrument_get_indices_with_http_info(opts)
      return data
    end

    # Get all price indices.
    # 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Array<Instrument>, Fixnum, Hash)>] Array<Instrument> data, response status code and response headers
    def instrument_get_indices_with_http_info(opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug "Calling API: InstrumentApi.instrument_get_indices ..."
      end
      # resource path
      local_var_path = "/instrument/indices"

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json', 'application/xml', 'text/xml', 'application/javascript', 'text/javascript'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = form_params
      auth_names = []
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'Array<Instrument>')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: InstrumentApi#instrument_get_indices\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
