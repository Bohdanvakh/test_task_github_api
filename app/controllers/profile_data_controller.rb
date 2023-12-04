class ProfileDataController < ApplicationController
  def new; end

  def show
    github_login = params[:github_login]
    @result = GithubApiService.get_github_data(github_login)

    respond_to do |format|
      format.html
      format.json { render json: @result }
    end
  end
end
