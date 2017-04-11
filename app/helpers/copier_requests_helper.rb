module CopierRequestsHelper
    def create_copier_from_request(req)
      @copier = Copier.new(name: req.req_name, oem: req.req_oem, marketer: req.req_marketer, embedded_platform: req.req_embedded_platform, 
                     general_notes: req.req_general_notes, aka: req.req_aka, intro_date: req.req_intro_date, 
                     disc_date: req.req_disc_date, print: req.req_print, copy: req.req_copy, scan: req.req_scan, fax: req.req_fax, card_reader_support: req.req_card_reader_support, 
                     oem_vending_harness_01: req.req_oem_vending_harness_01, acdi_vending_harness_01: req.req_acdi_vending_harness_01,
                     pcb_details_01: req.req_pcb_details_01, acdi_vending_harness_02: req.req_acdi_vending_harness_02, oem_vending_harness_02: req.req_oem_vending_harness_02, 
                     pcb_details_02: req.req_pcb_details_02, name_details: req.req_name_details, model_type: req.req_model_type, manufacturing_status: req.req_manufacturing_status,
                     print_speed: req.req_print_speed,  supported_notes_01: req.req_supported_notes_01, supported_notes_02: req.req_supported_notes_02, 
                     supported_status: req.req_supported_status)
                     
      return true if @copier.save
    end
end
