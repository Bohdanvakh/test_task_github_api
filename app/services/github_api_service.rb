class GithubApiService
  def self.get_github_data(github_login)
    response = HTTParty.get("https://api.github.com/users/#{github_login}/repos")

    if response.success?
      repositories = JSON.parse(response.body).map { |repo| repo["name"] }
      user_name = JSON.parse(response.body).first["owner"]["login"]
      { name: user_name, repositories: repositories }
    else
      { name: nil, repositories: [] }
    end
  end
end
