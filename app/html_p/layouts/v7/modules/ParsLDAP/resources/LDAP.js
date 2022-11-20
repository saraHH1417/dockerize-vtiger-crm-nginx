/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
var Vtiger_ParsLDAP_Js = {


    RegisterActions: function () {

        $('#ldap_authtype').on('change', function() {
            $('#ParsLDAP').hide();
            $('#ActiveDirectory').hide();
            if (this.value === 'LDAP') {
                $('#ParsLDAP').show();
            }
            if (this.value === 'AD') {
                $('#ActiveDirectory').show();
            }
        });

        $("#installLDAP").on('click', function () {
            app.helper.showProgress();
            var params = {};
            params['action'] = 'ActionAjax';
            params['module'] = 'ParsLDAP';
            params['mode'] = 'INSTALLLDAP';
            app.request.post({data: params}).then(
                function (err, data) {
                    app.helper.hideProgress();
                    if (err == null) {
                        if (data.installed) {
                            app.helper.showSuccessNotification({'message': data.message});
                            window.location.reload();
                        } else {
                            app.helper.showErrorNotification({'message': data.message});
                            window.location.reload();
                        }
                    } else {
                        app.helper.showErrorNotification({'message': err.result.message});
                    }

                }
            );
        });
        $('.TestLDAPBTN').click(function (event) {
            var url = 'index.php?module=ParsLDAP&parent=Settings&view=TestAjax&mode=TestLDAP';
            app.request.get({'url': url}).then(
                function (err, data) {
                    if (err === null) {
                        app.helper.showModal(data);
                    } else {
                        app.helper.showErrorNotification({'message': err.message});
                    }
                }
            );
        });
    },
    //end utils
    /**
     * Function to register required events
     */
    registerEvents: function () {
        var thisInstance = this;
        thisInstance.RegisterActions();
    }

};
//On Page Load
jQuery(document).ready(function () {
    Vtiger_ParsLDAP_Js.registerEvents();
    Vtiger_Index_Js.getInstance().registerEvents();
});

