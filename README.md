# EliXero

## Usage instructions

In order to use this SDK, you will need to have created an application in the [developer portal](https://app.xero.com).
Once you've created your application you'll need to build a configuration file that stores you consumer key and secret as well as signing certificate information if applicable.

You will need to name the file 'xero_app_config.exs' and it will need to be structured to so

```
config :elixero,
  private_key_path: "path_to_signing_certificate",
  consumer_key: "your_applications_consumer_key",
  consumer_secret: "your_applications_consumer_secret",
  callback_url: "callback_url_if_applicable",
  app_type: atom_denoting_app_type
```

Note:
* private_key_path is only applicable for private/partner applications. The path should be pointing to the .pem certificate that correlates with the certificate uploaded into the developer portal
* callback_url is only applicable for public/partner applications and used when authorising a request token to call back into your system after authorization to prevent the user from needing to manually input a verification code. This should be set to "oob" if you are not using a callback url 
* app type should be either :private, :public, or :partner depending on the type of application you have created

### Private application usage

Private applications are not required to go through the process of acquiring a request token, authorising it, and then swaping it for an access token.

#### Required config variables

* private_key_path - path pointing to the .pem certificate that correlates with the certificate uploaded into the developer portal
* consumer_key - consumer key found in the overview page of your application in the developer portal
* consumer_secret - consumer secret found in the overview page of your application in the developer portal
* app_type - must be :private

Once you have set up your config file you can use your private application like so:

1. Create a client
  ```
  client = EliXero.create_client
  ```

2. Use the client when calling the Xero API
  ```
  EliXero.CoreApi.Invoices.find client
  ```

It's that easy.

### Public application usage

Public applications must be authorised for use against a user's organisation and must follow the oauth flow of acquiring a request token, having the request token authorised for an organisation, and swapping the request token for an access token. The access token must then be used with all API calls

#### Required config variables

* consumer_key - consumer key found in the overview page of your application in the developer portal
* consumer_secret - consumer secret found in the overview page of your application in the developer portal
* callback_url - "oob" if not using a callback url otherwise set to the url you want to be called back into after the user autorises the connection for an organisation
* app_type - must be :public

Once you have set up your config file you can use your public application like so:

1. Acquire a request token
  ```
  request_token = EliXero.get_request_token
  ```

2. Authorise the request token via user interaction
  The request token map will contain an auth_url key. The value for this key is the URL that you should direct the user to so that they can authorise your app to access an organisation.

3. Create a client
  Once the user has authorised the connection to an organisation and you have retrieved the verification code either from the user themself or the request back into your callback url, do the following:
  ```
  client = EliXero.create_client request_token, "VERIFICATION CODE"
  ```

4. Use the client when calling the Xero API
  ```
  EliXero.CoreApi.Invoices.find client
  ```

### Partner application usage

Partner applications are like a hybrid of both private and public applications. Partner applications use signing certificates like private applications but also require the same oauth process as public applications to recieve access tokens. Partner applications can also renew their access tokens after they expire preventing the user from needing to re-authorise the connection after 30 mins of usage.

#### Required config variables

* private_key_path - path pointing to the .pem certificate that correlates with the certificate uploaded into the developer portal
* consumer_key - consumer key found in the overview page of your application in the developer portal
* consumer_secret - consumer secret found in the overview page of your application in the developer portal
* callback_url - "oob" if not using a callback url otherwise set to the url you want to be called back into after the user autorises the connection for an organisation
* app_type - must be :partner

Once you have set up your config file you can use your partner application like so:

1. Acquire a request token
  ```
  request_token = EliXero.get_request_token
  ```

2. Authorise the request token via user interaction
  The request token map will contain an auth_url key. The value for this key is the URL that you should direct the user to so that they can authorise your app to access an organisation.

3. Create a client
  Once the user has authorised the connection to an organisation and you have retrieved the verification code either from the user themself or the request back into your callback url, do the following:
  ```
  client = EliXero.create_client request_token, "VERIFICATION CODE"
  ```

4. Use the client when calling the Xero API
  ```
  EliXero.CoreApi.Invoices.find client
  ```

After your access token has expired, partner applications can renew them without the need for user input via authorisation.
Given your existing access token is in a variable named access_token, this can be done like so:
```
renewed_client = EliXero.renew_client client
```

Note: Renewing a client renews the underlying access token. The original client cannot be used after renewing it.

## Use of filter functions

Some endpoints allow various filter methods when retrieving information from the Xero API. 
All filtering, with the exception of if-modified-since, is performed via query parameters. If-modified-since is done via a header.

When using filtering, a map outlining what filtering you want needs to be supplied.

Below is an example on how to do this when you want to retrieve all DRAFT, ACCREC invoices, ordered by Date desc, modified since the start of 2017:

```
filter = %{:query_filters => [{"where", "Status==\"DRAFT\" AND Type==\"ACCREC\""}, {"orderby", "Date desc"}], :modified_since => "2017-01-01" }

EliXero.CoreApi.Invoices.filter cient, filter
```

You do not need to supply both :query_filters and :modified_since if you only want to filter by one of them.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add `elixero` to your list of dependencies in `mix.exs`:

    ```elixir
    def deps do
      [{:elixero, "~> 0.0.5"}]
    end
    ```

  2. Ensure `elixero` is started before your application:

    ```elixir
    def application do
      [applications: [:elixero]]
    end
    ```

