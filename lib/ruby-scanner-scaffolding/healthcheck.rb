require 'json'

def healthcheck(client)

  test_run = scanner_test
  status 500
  if healthy?(client, test_run)
    status 200
  end

  content_type :json
  {
      started_at: client.start_time,
      worker_id: client.worker_id,
      healthcheck: healthy?(client, test_run),
      status: {
          started: client.started_tasks,
          completed: client.completed_tasks,
          failed: client.failed_tasks
      },
      engine: {
          connected_engine: client.camunda_url,
          last_successful_connection: client.last_connect
      },
      scanner: {
          version: 'latest',
          test_run: scanner_test
      },
      build: {
          repository_url: client.repository_url,
          branch: client.branch,
          commit_id: client.commit_id
      }
  }.to_json
end

def healthy?(worker, test_run)
  test_run == "SUCCESSFUL"
end

def scanner_test
  "SUCCESSFUL"
end

