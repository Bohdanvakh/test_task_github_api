class GithubApiService
  def self.get_github_data(github_login)
    response_name = HTTParty.get("#{ENV['GITHUB_API_HOST']}#{github_login}")
    response_repos = HTTParty.get("#{ENV['GITHUB_API_HOST']}#{github_login}/repos")

    if response_name.success? && response_repos.success?
      repositories = JSON.parse(response_repos.body).map { |repo| repo['name'] }
      user_name = response_name['name']

      { name: user_name, repositories: }
    else
      { error: I18n.t('errors.fetching'), name: nil, repositories: [] }
    end
  end
end
