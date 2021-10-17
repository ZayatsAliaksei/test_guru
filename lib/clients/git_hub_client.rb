class GitHubClient
  ACCESS_TOKEN = ENV['ACCESS_TOKEN']
  #params = {"description": "test","public": true, "files":{"file1.txt": {"content": "Sting file contents"}}}
  attr_reader :octokit_client

  def initialize
    @octokit_client = setup_http_client
  end

  def create_gist(params)
    @octokit_client.create_gist(params)
  end

  private

  def setup_http_client
    Octokit::Client.new(access_token: ENV["ACCESS_TOKEN"])
  end

end
