require "mina/slack/promulgator/version"
require "mina/slack/promulgator/helper"

set_default :slack_promulgator_webhook_url, nil
set_default :slack_promulgator_channel, '#general'
set_default :slack_promulgator_name, 'Promulgator'
set_default :slack_promulgator_application_emoji, ':earth_americas:'
set_default :slack_promulgator_success_message_emoji, ':rocket:'
set_default :slack_promulgator_failure_message_emoji, ':boom:'
set_default :slack_promulgator_github_url, Mina::Slack::Promulgator::Helper.default_github_url

namespace :slack do

  namespace :promulgator do

    task :success do
      Mina::Slack::Promulgator::Helper.requirements_check(slack_promulgator_webhook_url)

      message = Mina::Slack::Promulgator::Helper.success_message(slack_promulgator_success_message_emoji, project_name, slack_promulgator_github_url)
      payload = Mina::Slack::Promulgator::Helper.success_payload(message, slack_promulgator_channel, slack_promulgator_name, slack_promulgator_application_emoji)

      queue %{
        export GIT_HASH=$(cd #{deploy_to}/scm && git rev-parse #{commit || branch})
        echo "-----> Posting Deploy Success to Slack #{slack_promulgator_channel}"
        curl -X POST --data-urlencode 'payload=#{payload}' #{slack_promulgator_webhook_url}
      }
    end

    task :failure do
      Mina::Slack::Promulgator::Helper.requirements_check(slack_promulgator_webhook_url)

      message = Mina::Slack::Promulgator::Helper.failure_message(slack_promulgator_failure_message_emoji, project_name, slack_promulgator_github_url)
      payload = Mina::Slack::Promulgator::Helper.failure_payload(message, slack_promulgator_channel, slack_promulgator_name, slack_promulgator_application_emoji)

      queue %{
        export GIT_HASH=$(cd #{deploy_to}/scm && git rev-parse #{commit || branch})
        echo "-----> Posting Deploy Failure to Slack #{slack_promulgator_channel}"
        curl -X POST --data-urlencode 'payload=#{payload}' #{slack_promulgator_webhook_url}
      }
    end

  end

end
