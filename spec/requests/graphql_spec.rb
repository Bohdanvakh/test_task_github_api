require 'rails_helper'

RSpec.describe 'GitHub API requests', type: :request do
  let(:valid_login_name) { 'David Heinemeier Hansson' }

  it 'fetches user data from GitHub' do
    VCR.use_cassette('github_api_request_fetches_user_data') do
      post '/graphql', params: { query: 'query { getGithubData(githubLogin: "dhh" )}' }

      json_response = JSON.parse(response.body)
      user_data_string = json_response['data']['getGithubData']
      user_data_hash = eval(user_data_string)

      expect(response.code).to eq('200')
      expect(user_data_hash[:name]).to eq(valid_login_name)
      expect(user_data_hash[:repositories].any?).to be(true)
    end
  end

  it 'returns empty list of repos' do
    VCR.use_cassette('github_api_request_returns_empty_repos') do
      post '/graphql', params: { query: 'query { getGithubData(githubLogin: "this_user_doesnt_exist")}' }

      json_response = JSON.parse(response.body)
      user_data_string = json_response['data']['getGithubData']
      user_data_hash = eval(user_data_string)

      expect(response.code).to eq('200')
      expect(user_data_hash[:name]).to be_nil
      expect(user_data_hash[:repositories].any?).to be(false)
      expect(user_data_hash[:error]).to eq(I18n.t('errors.fetching'))
    end
  end
end
