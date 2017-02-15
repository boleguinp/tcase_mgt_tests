# file: page_objects/tcasemgt/page_objects/pages/projects/index_page.rb
#
module TCasemgt
  module PageObjects
    module Pages
      module Project
        class IndexPage < SitePrism::Page
          set_url "/projects"

          def click_NewProject
            click_link 'New Project'
          end
        end
      end
    end
  end
end
