*** Variables ***

# Return codes
${SUCCESS}      200
${ADDON_SUCCESS}    201
${UNAUTHORIZED_ACCESS}  407
${INTERNAL_SERVER_ERROR}    500
${FORBIDDEN_ACCESS}     403


# URL endpoints

# Authentication
${get_tenant_api}   /tenant/home
${login_api}    /tenant/trainer/login

#Notes
${add_notes_api}    /trainer/addnotes
