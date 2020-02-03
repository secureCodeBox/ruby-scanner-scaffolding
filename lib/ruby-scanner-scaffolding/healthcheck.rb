require 'json'

class Healthcheck
  def check(client)
    {
        started_at: client.start_time,
        worker_id: client.worker_id,
        healthcheck: healthy?(client),
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
          test_run: client.healthy?,
          version: client.version
        },
        build: {
            repository_url: client.repository_url,
            branch: client.branch,
            commit_id: client.commit_id
        }
    }.to_json
  end
end
