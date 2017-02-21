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
          def remove_Project(project_title, page)
              @tr = page.find(:xpath, '//tr/td', text: project_title).find(:xpath, '..')
            unless ENV['BROWSER_TYPE'].blank?
                @tr.find(:xpath, 'td', text: 'Remove').click_link('Remove')
            else
                accept_alert do
                  @tr.find(:xpath, 'td', text: 'Remove').click_link('Remove')
                end
            end
          end
          def click_UpdateProject(project_title_old, page)
              # Click Update
              @tr = page.find(:xpath, '//tr/td', text: project_title_old).find(:xpath, '..')
              @tr.find(:xpath, 'td', text: 'Update').click_link('Update')
          end
        end
      end
    end
  end
end
