# file: page_objects/tcasemgt/page_objects/pages/projects/edit_page.rb
#
module TCasemgt
  module PageObjects
    module Pages
      module Project
        class EditPage < SitePrism::Page
          set_url @current_url
          def set_page_url(current_url)
            @current_url = current_url
          end
          def update_Project(project_title, project_description)
            fill_in 'Title', with: project_title
            fill_in 'Description', with: project_description
            click_button 'Update Project'
            click_link 'Back'
          end
        end
      end
    end
  end
end
