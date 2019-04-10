require 'rest-client'

def scanner_test
  begin
    response = RestClient::Request.execute(
        method: :get,
        url: 'http://127.0.0.1:7331/scans',
        timeout: 2
    )
    if response.code == 200
      "SUCCESSFUL"
    else
      "FAILED"
    end
  rescue
    "FAILED"
  end
end