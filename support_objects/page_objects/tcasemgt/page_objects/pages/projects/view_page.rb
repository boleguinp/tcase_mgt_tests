# file: page_objects/tcasemgt/page_objects/pages/projects/new_page.rb
#
module TCasemgt
  module PageObjects
    module Pages
      module Project
        class ViewPage < SitePrism::Page
          # set_url "/projects/new"
          def set_page_url(base_url)
            self.class.set_url base_url
          end

          def create_NewTCase(tcase_id, tcase_title, tcase_scenario, tcase_status)
            fill_in 'TCase', with: tcase_id
            fill_in 'Title', with: tcase_title
            fill_in 'Scenario', with: tcase_scenario
            fill_in 'Status', with: tcase_status
            click_button 'Create T case'
          end
          def remove_TCase(tcase_id, page)
            # Click View
            @tr = page.find(:xpath, '//tr/td', text: tcase_id).find(:xpath, '..')
            unless ENV['BROWSER_TYPE'].blank?
              @tr.find(:xpath, 'td', text: 'Remove').click_link('Remove')
            else
              accept_alert do
                @tr.find(:xpath, 'td', text: 'Remove').click_link('Remove')
              end
            end
          end
        end
      end
    end
  end
end
