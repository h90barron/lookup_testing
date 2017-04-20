class CreateMatrixMfds < ActiveRecord::Migration
  def change
    create_table :matrix_mfds do |t|
      t.string :oem
      t.string :integrated_scanning
      t.string :supported_card_readers
      t.string :supported_related_brands
      t.string :solution_type
      t.string :zero_stop
      t.string :restrict_color_copying
      t.string :enforced_login_workflow
      t.string :shared_account_selection_list
      t.string :shared_account_keyword_search
      t.string :shared_account_selection_code
      t.string :shared_account_invoicing
      t.string :customizable_logos
      t.string :track_faxing
      t.string :track_usb_printing
      t.string :track_scanning
      t.string :auto_populate_email_scanning_to
      t.string :auto_populate_email_scanning_from
      t.string :fine_system_access_control
      t.string :secure_print_release
      t.string :release_jobs_on_login
      t.string :release_jobs_from_list
      t.string :block_jobs_printer_error
      t.string :user_auth_at_device
      t.string :username_and_password_auth
      t.string :id_only_auth
      t.string :id_pin_auth
      t.string :card_only_auth
      t.string :card_pin_auth
      t.string :self_association_cards
      t.string :set_pin_first_login
      t.string :single_sign_on
      t.string :swipe_log_out
      t.string :offline_mode
      t.string :extra_license_requirements
      t.string :assisted_setup
      t.string :security_rating
      t.string :install_time
      t.string :supported_server_os
      t.string :character_sets_supported
      t.string :guest_access
      t.timestamps null: false
    end
  end
end
