defmodule EliXero.Utils.Urls do

  #urls
  @base_url "https://api.xero.com/"
  @request_token_url @base_url <> "oauth/RequestToken"
  @access_token_url @base_url <> "oauth/AccessToken"
  @authorise_url @base_url <> "oauth/Authorize"

  #api_types
  @core_api "api.xro/2.0/"
  @payroll_api "payroll.xro/1.0/"
  @files_api "files.xro/1.0/"
  @assets_api "assets.xro/1.0/"

  def request_token do
    @request_token_url
  end

  def authorise(oauth_token) do
    @authorise_url <> "?oauth_token=" <> oauth_token
  end

  def access_token do
    @access_token_url
  end

  def api(resource, api_type) do
    api = 
      case(api_type) do
        :core -> @core_api
        :payroll -> @payroll_api
        :files -> @files_api
        :assets -> @assets_api
      end

    @base_url <> api <> resource
  end

end