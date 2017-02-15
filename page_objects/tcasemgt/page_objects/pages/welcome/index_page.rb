# file: page_objects/tcasemgt/page_objects/pages/welcome/index_page.rb
#
module TCasemgt
  module PageObjects
    module Pages
      module Welcome
        class IndexPage < SitePrism::Page
          set_url "/welcome/index"

          def click_MyProjects
            click_link 'My Projects'
          end
        end
      end
    end
  end
end
