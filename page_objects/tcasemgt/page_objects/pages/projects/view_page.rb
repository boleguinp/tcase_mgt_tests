# file: page_objects/tcasemgt/page_objects/pages/projects/edit_page.rb
#
module TCasemgt
  module PageObjects
    module Pages
      module Project
        class ViewPage < SitePrism::Page
          set_url @current_url
          def set_page_url(current_url)
            @current_url = current_url
          end
          def create_NewTCase(tcase_id, tcase_title, tcase_scenario, tcase_status)
            fill_in 'T case', with: tcase_id
            fill_in 'Title', with: tcase_title
            fill_in 'Scenario', with: tcase_scenario
            fill_in 'Status', with: tcase_status
            click_button 'Create T case'
          end
          def remove_TCase(tcase_title, page)
              @tr = page.find(:xpath, '//tr/td', text: tcase_title).find(:xpath, '..')
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
