
module Guardrc
  module Snippet
    module Notification
      def self.off
        "notification :off"
      end
      def self.on
        "notification :on"
      end
    end
    module Testingtools
      def self.cucumber
        %q@
        guard 'cucumber' do
          watch(%r{^features/.+\.feature$})
          watch(%r{^features/support/.+$})          { 'features' }
          watch(%r{^features/step_definitions/(.+)_steps\.rb$}) { |m| Dir[File.join("**/#{m[1]}.feature")][0] || 'features' }
          watch(%r{^lib/.+$})          { 'features' }
        end
        @
      end
      def self.rspec
        %q@
        guard 'rspec', :version => 2 do
          watch(%r{^spec/.+_spec\.rb$})
          watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
          watch('spec/spec_helper.rb')  { "spec" }

          # Rails example
          watch(%r{^app/(.+)\.rb$})                           { |m| "spec/#{m[1]}_spec.rb" }
          watch(%r{^app/(.*)(\.erb|\.haml)$})                 { |m| "spec/#{m[1]}#{m[2]}_spec.rb" }
          watch(%r{^app/controllers/(.+)_(controller)\.rb$})  { |m| ["spec/routing/#{m[1]}_routing_spec.rb", "spec/#{m[2]}s/#{m[1]}_#{m[2]}_spec.rb", "spec/acceptance/#{m[1]}_spec.rb"] }
          watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }
          watch('config/routes.rb')                           { "spec/routing" }
          watch('app/controllers/application_controller.rb')  { "spec/controllers" }
          # Capybara request specs
          watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/requests/#{m[1]}_spec.rb" }
        end
        @
      end
      def self.cucumber_and_rspec
        cucumber + rspec
      end
    end
  end
end

module Guardrc
  def self.load(path)
    File.open("#{path}", 'r') { |f| f.read }
  end
end
