class GithubApiService
  def self.get_github_data(github_login)
    response_name = HTTParty.get("https://api.github.com/users/#{github_login}")
    response_repos = HTTParty.get("https://api.github.com/users/#{github_login}/repos")

    if response_name.success? && response_repos.success?
      repositories = JSON.parse(response_repos.body).map { |repo| repo["name"] }
      user_name = response_name["name"]

      { name: user_name, repositories: repositories }
    else
      { error: I18n.t('errors.fetching'), name: nil, repositories: [] }
    end
  end
end
