require 'rails_helper'

RSpec.describe 'ProfileDataController', type: :request do
  let(:valid_login) { 'dhh' }
  let(:invalid_login) { 'this_user_doesnt_exist' }
  let(:valid_login_name) { 'David Heinemeier Hansson' }

  it 'fetches user data from GitHub' do
    VCR.use_cassette('show_request_fetches_github_api_user_data') do
      get '/show', params: { github_login: valid_login }, as: :json
      json_response = JSON.parse(response.body)

      expect(response.code).to eq('200')
      expect(json_response['name']).to eq(valid_login_name)
      expect(json_response['repositories'].any?).to eq(true)
    end
  end

  it 'returns empty list of repos' do
    VCR.use_cassette('show_request_fetches_emplty_list') do
      get '/show', params: { github_login: invalid_login }, as: :json
      json_response = JSON.parse(response.body)

      expect(response.code).to eq('200')
      expect(json_response['name']).to be_nil
      expect(json_response['repositories'].any?).to eq(false)
      expect(json_response['error']).to eq(I18n.t('errors.fetching'))
    end
  end
end
