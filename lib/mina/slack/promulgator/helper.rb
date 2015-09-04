module Mina
  module Slack
    module Promulgator
      class Helper

        def self.requirements_check(slack_promulgator_webhook_url)
          raise "Must set 'slack_promulgator_webhook_url' in your deploy file for promulgator to work" unless slack_promulgator_webhook_url
        end

        def self.default_github_url
          remote_origin_url = `git config --get remote.origin.url`
          path = remote_origin_url.gsub("git@", "").gsub(".git", "").gsub("github.com:", "github.com/")
          "https://#{path}".strip
        end

        def self.success_message(emoji, project_name, github_url)
          "#{emoji} [#{project_name}] deployed: #{github_url}/commit/'\"$GIT_HASH\"'"
        end

        def self.failure_message(emoji, project_name, github_url)
          "#{emoji} [#{project_name}] deploy failed: #{github_url}/commit/'\"$GIT_HASH\"'"
        end

        def self.success_payload(text, channel, name, application_emoji)
          %{{"text": "#{text}", "channel": "#{channel}", "username": "#{name}", "icon_emoji": "#{application_emoji}"}}
        end

        def self.failure_payload(text, channel, name, application_emoji)
          %{{"attachments": [ { "fallback": "#{text}", "color": "danger", "text": "#{text}" } ], "channel": "#{channel}", "username": "#{name}", "icon_emoji": "#{application_emoji}"}}
        end

      end
    end
  end
end


