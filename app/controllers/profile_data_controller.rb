class ProfileDataController < ApplicationController
  def new
  end

  def lorem
    binding.pry
  end

  def create

    binding.pry

    github_login = params[:github_login]
    @result = GithubApiService.get_github_data(github_login)

    binding.pry

    puts @result
  end
end
