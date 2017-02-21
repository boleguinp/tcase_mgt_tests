# file: page_objects/tcasemgt/page_objects/pages/projects/new_page.rb
#
module TCasemgt
  module PageObjects
    module Pages
      module Project
        class NewPage < SitePrism::Page
          set_url "/projects/new"
          def create_NewProject(project_title, project_description)
            fill_in 'Title', with: project_title
            fill_in 'Description', with: project_description
            click_button 'Create Project'
            click_link 'Back'
          end
        end
      end
    end
  end
end
