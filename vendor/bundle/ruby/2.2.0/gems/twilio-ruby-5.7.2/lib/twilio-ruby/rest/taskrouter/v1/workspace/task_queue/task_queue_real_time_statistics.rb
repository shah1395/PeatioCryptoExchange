##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class TaskQueueContext < InstanceContext
            class TaskQueueRealTimeStatisticsList < ListResource
              ##
              # Initialize the TaskQueueRealTimeStatisticsList
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] task_queue_sid The task_queue_sid
              # @return [TaskQueueRealTimeStatisticsList] TaskQueueRealTimeStatisticsList
              def initialize(version, workspace_sid: nil, task_queue_sid: nil)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, task_queue_sid: task_queue_sid}
              end

              ##
              # Provide a user friendly representation
              def to_s
                '#<Twilio.Taskrouter.V1.TaskQueueRealTimeStatisticsList>'
              end
            end

            class TaskQueueRealTimeStatisticsPage < Page
              ##
              # Initialize the TaskQueueRealTimeStatisticsPage
              # @param [Version] version Version that contains the resource
              # @param [Response] response Response from the API
              # @param [Hash] solution Path solution for the resource
              # @return [TaskQueueRealTimeStatisticsPage] TaskQueueRealTimeStatisticsPage
              def initialize(version, response, solution)
                super(version, response)

                # Path Solution
                @solution = solution
              end

              ##
              # Build an instance of TaskQueueRealTimeStatisticsInstance
              # @param [Hash] payload Payload response from the API
              # @return [TaskQueueRealTimeStatisticsInstance] TaskQueueRealTimeStatisticsInstance
              def get_instance(payload)
                TaskQueueRealTimeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    task_queue_sid: @solution[:task_queue_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                '<Twilio.Taskrouter.V1.TaskQueueRealTimeStatisticsPage>'
              end
            end

            class TaskQueueRealTimeStatisticsContext < InstanceContext
              ##
              # Initialize the TaskQueueRealTimeStatisticsContext
              # @param [Version] version Version that contains the resource
              # @param [String] workspace_sid The workspace_sid
              # @param [String] task_queue_sid The task_queue_sid
              # @return [TaskQueueRealTimeStatisticsContext] TaskQueueRealTimeStatisticsContext
              def initialize(version, workspace_sid, task_queue_sid)
                super(version)

                # Path Solution
                @solution = {workspace_sid: workspace_sid, task_queue_sid: task_queue_sid, }
                @uri = "/Workspaces/#{@solution[:workspace_sid]}/TaskQueues/#{@solution[:task_queue_sid]}/RealTimeStatistics"
              end

              ##
              # Fetch a TaskQueueRealTimeStatisticsInstance
              # @param [String] task_channel The task_channel
              # @return [TaskQueueRealTimeStatisticsInstance] Fetched TaskQueueRealTimeStatisticsInstance
              def fetch(task_channel: :unset)
                params = Twilio::Values.of({'TaskChannel' => task_channel, })

                payload = @version.fetch(
                    'GET',
                    @uri,
                    params,
                )

                TaskQueueRealTimeStatisticsInstance.new(
                    @version,
                    payload,
                    workspace_sid: @solution[:workspace_sid],
                    task_queue_sid: @solution[:task_queue_sid],
                )
              end

              ##
              # Provide a user friendly representation
              def to_s
                context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
                "#<Twilio.Taskrouter.V1.TaskQueueRealTimeStatisticsContext #{context}>"
              end
            end

            class TaskQueueRealTimeStatisticsInstance < InstanceResource
              ##
              # Initialize the TaskQueueRealTimeStatisticsInstance
              # @param [Version] version Version that contains the resource
              # @param [Hash] payload payload that contains response from Twilio
              # @param [String] workspace_sid The workspace_sid
              # @param [String] task_queue_sid The task_queue_sid
              # @return [TaskQueueRealTimeStatisticsInstance] TaskQueueRealTimeStatisticsInstance
              def initialize(version, payload, workspace_sid: nil, task_queue_sid: nil)
                super(version)

                # Marshaled Properties
                @properties = {
                    'account_sid' => payload['account_sid'],
                    'activity_statistics' => payload['activity_statistics'],
                    'longest_task_waiting_age' => payload['longest_task_waiting_age'].to_i,
                    'task_queue_sid' => payload['task_queue_sid'],
                    'tasks_by_priority' => payload['tasks_by_priority'],
                    'tasks_by_status' => payload['tasks_by_status'],
                    'total_available_workers' => payload['total_available_workers'].to_i,
                    'total_eligible_workers' => payload['total_eligible_workers'].to_i,
                    'total_tasks' => payload['total_tasks'].to_i,
                    'workspace_sid' => payload['workspace_sid'],
                    'url' => payload['url'],
                }

                # Context
                @instance_context = nil
                @params = {'workspace_sid' => workspace_sid, 'task_queue_sid' => task_queue_sid, }
              end

              ##
              # Generate an instance context for the instance, the context is capable of
              # performing various actions.  All instance actions are proxied to the context
              # @return [TaskQueueRealTimeStatisticsContext] TaskQueueRealTimeStatisticsContext for this TaskQueueRealTimeStatisticsInstance
              def context
                unless @instance_context
                  @instance_context = TaskQueueRealTimeStatisticsContext.new(
                      @version,
                      @params['workspace_sid'],
                      @params['task_queue_sid'],
                  )
                end
                @instance_context
              end

              ##
              # @return [String] The account_sid
              def account_sid
                @properties['account_sid']
              end

              ##
              # @return [Hash] The activity_statistics
              def activity_statistics
                @properties['activity_statistics']
              end

              ##
              # @return [String] The longest_task_waiting_age
              def longest_task_waiting_age
                @properties['longest_task_waiting_age']
              end

              ##
              # @return [String] The task_queue_sid
              def task_queue_sid
                @properties['task_queue_sid']
              end

              ##
              # @return [Hash] The tasks_by_priority
              def tasks_by_priority
                @properties['tasks_by_priority']
              end

              ##
              # @return [Hash] The tasks_by_status
              def tasks_by_status
                @properties['tasks_by_status']
              end

              ##
              # @return [String] The total_available_workers
              def total_available_workers
                @properties['total_available_workers']
              end

              ##
              # @return [String] The total_eligible_workers
              def total_eligible_workers
                @properties['total_eligible_workers']
              end

              ##
              # @return [String] The total_tasks
              def total_tasks
                @properties['total_tasks']
              end

              ##
              # @return [String] The workspace_sid
              def workspace_sid
                @properties['workspace_sid']
              end

              ##
              # @return [String] The url
              def url
                @properties['url']
              end

              ##
              # Fetch a TaskQueueRealTimeStatisticsInstance
              # @param [String] task_channel The task_channel
              # @return [TaskQueueRealTimeStatisticsInstance] Fetched TaskQueueRealTimeStatisticsInstance
              def fetch(task_channel: :unset)
                context.fetch(task_channel: task_channel, )
              end

              ##
              # Provide a user friendly representation
              def to_s
                values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.TaskQueueRealTimeStatisticsInstance #{values}>"
              end

              ##
              # Provide a detailed, user friendly representation
              def inspect
                values = @properties.map{|k, v| "#{k}: #{v}"}.join(" ")
                "<Twilio.Taskrouter.V1.TaskQueueRealTimeStatisticsInstance #{values}>"
              end
            end
          end
        end
      end
    end
  end
end