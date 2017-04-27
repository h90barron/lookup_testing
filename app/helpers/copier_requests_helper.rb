module CopierRequestsHelper
    # create copier from request. if copr_id is present in req params then update existing copier. if not then create new.

    def create_copier_from_request(req)
      if req.copr_id.empty?
        @copier = Copier.new(name: req.req_name, oem: req.req_oem, marketer: req.req_marketer, embedded_platform: req.req_embedded_platform, 
                      general_notes: req.req_general_notes, aka: req.req_aka, intro_date: req.req_intro_date, 
                      disc_date: req.req_disc_date, print: req.req_print, copy: req.req_copy, scan: req.req_scan, fax: req.req_fax, card_reader_support: req.req_card_reader_support, 
                      oem_vending_harness_01: req.req_oem_vending_harness_01, acdi_vending_harness_01: req.req_acdi_vending_harness_01,
                      pcb_details_01: req.req_pcb_details_01, acdi_vending_harness_02: req.req_acdi_vending_harness_02, oem_vending_harness_02: req.req_oem_vending_harness_02, 
                      pcb_details_02: req.req_pcb_details_02, name_details: req.req_name_details, model_type: req.req_model_type, manufacturing_status: req.req_manufacturing_status,
                      print_speed: req.req_print_speed,  supported_notes_01: req.req_supported_notes_01, supported_notes_02: req.req_supported_notes_02, 
                      supported_status: req.req_supported_status)
        return true if @copier.save
      else
        
        @copier = Copier.find_by(id: req.copr_id)
        return true if @copier.update_columns(name: req.req_name, oem: req.req_oem, marketer: req.req_marketer, embedded_platform: req.req_embedded_platform, 
                      general_notes: req.req_general_notes, aka: req.req_aka, intro_date: req.req_intro_date, 
                      disc_date: req.req_disc_date, print: req.req_print, copy: req.req_copy, scan: req.req_scan, fax: req.req_fax, card_reader_support: req.req_card_reader_support, 
                      oem_vending_harness_01: req.req_oem_vending_harness_01, acdi_vending_harness_01: req.req_acdi_vending_harness_01,
                      pcb_details_01: req.req_pcb_details_01, acdi_vending_harness_02: req.req_acdi_vending_harness_02, oem_vending_harness_02: req.req_oem_vending_harness_02, 
                      pcb_details_02: req.req_pcb_details_02, name_details: req.req_name_details, model_type: req.req_model_type, manufacturing_status: req.req_manufacturing_status,
                      print_speed: req.req_print_speed,  supported_notes_01: req.req_supported_notes_01, supported_notes_02: req.req_supported_notes_02, 
                      supported_status: req.req_supported_status)        
      end
      
    end
    
    # creates request from existing copier. all fields are populated with the copiers field vals. 
    
    def create_request_from_copier(copier)
      @request = CopierRequest.new(req_name: copier.name, req_oem: copier.oem, req_marketer: copier.marketer, req_embedded_platform: copier.embedded_platform, req_general_notes: copier.general_notes,
                                  req_aka: copier.aka, req_intro_date: copier.intro_date, req_disc_date: copier.disc_date, req_print: copier.print, req_copy: copier.copy, req_scan: copier.scan,
                                  req_fax: copier.fax, req_card_reader_support: copier.card_reader_support, req_oem_vending_harness_01: copier.oem_vending_harness_01, req_acdi_vending_harness_01: copier.acdi_vending_harness_01,
                                  req_pcb_details_01: copier.pcb_details_01, req_oem_vending_harness_02: copier.oem_vending_harness_02, req_acdi_vending_harness_02: copier.acdi_vending_harness_02,
                                  req_pcb_details_02: copier.pcb_details_02, req_name_details: copier.name_details, req_model_type: copier.model_type, req_manufacturing_status: copier.manufacturing_status,
                                  req_print_speed: copier.print_speed, req_supported_notes_01: copier.supported_notes_01, req_supported_notes_02: copier.supported_notes_02, req_supported_status: copier.supported_status,
                                  copr_id: copier.id)
      return @request
    end
end
