require 'rspec/expectations'
# file: page_objects/tcasemgt/page_objects/application.rb
module TCasemgt
  module PageObjects
    class Application
      include RSpec::Matchers
      def initialize
        @pages = {}
      end

      def index
        @pages[:index] ||= TCasemgt::PageObjects::Pages::Welcome::IndexPage.new
      end

      def projects
        @pages[:projects] ||= TCasemgt::PageObjects::Pages::Project::IndexPage.new
      end

      def newProject
        @pages[:newProject] ||= TCasemgt::PageObjects::Pages::Project::NewPage.new
      end

      def editProject
        @pages[:editProject] ||= TCasemgt::PageObjects::Pages::Project::EditPage.new
      end

      def viewProject
        @pages[:ViewProject] ||= TCasemgt::PageObjects::Pages::Project::ViewPage.new
      end

      def checkPage(content, page, has_content)
          unless has_content
            expect(page).not_to have_content(content)
          else
            expect(page).to have_content(content)
          end
      end

    end
  end
end
