class OctokitClient
  ROOT_ENDPOINT = 'https://api.github.com'
  # ACCESS_TOKEN = '40aa59457816d6a5990eebca5288e700c62bf4ad'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ ENV['ACCESS_TOKEN'] }"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end
  
end
