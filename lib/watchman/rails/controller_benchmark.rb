class Watchman
  module Rails
    module ControllerBenchmark

      def self.included(base)
        base.class_eval do
          around_action :watchman_rails_controller_benchmark
        end
      end

      def watchman_rails_controller_benchmark
        bench_controller_name = self.class
                                    .name
                                    .underscore
                                    .gsub("/", "_")
                                    .gsub(/_controller$/, "")

        name = "rails.controllers.#{bench_controller_name}.#{action_name}"

        Watchman.benchmark(name) { yield }
      end

    end
  end
end
