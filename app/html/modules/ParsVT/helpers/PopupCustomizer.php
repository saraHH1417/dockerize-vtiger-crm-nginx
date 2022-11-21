<?php
/* * *******************************************************************************
 * The content of this file is subject to the ParsVT Module license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTfarsi.ir are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 *  از این فایل برای سفارشی سازی پاپ آپ در کروم و ویندوز استفاده نمایید *
 * ****************************************************************************** */
class ParsVT_PopupCustomizer_Helper {

	var $showPopup;

	public function __construct( $show = false ) {
		$this->showPopup = $show;
	}

	public static function showComment( $record,$types, $customertype ,$currentUserModel) {
		$instance    = new self();
		$lastcomment = false;
		if ( $instance->showPopup === true ) {
			if ( in_array( "ServiceContracts", $types['types'] ) ) {
				$lastcomment .= ParsVT_V2_PBX_Asterisk::getServiceContracts( $record );
			}
			if ( in_array( "ModComments", $types['types'] ) ) {
				$getlastcomment = ParsVT_V2_PBX_Asterisk::getlastComment( $record, $customertype, $currentUserModel );
				$lastcomment    .= $getlastcomment;
			}
		}
		return $lastcomment;
	}

	public static function listSaveModules() {
		$instance = new self();
		$modules  = false;
		if ( $instance->showPopup === true ) {
			$modules = array();
			if ( Users_Privileges_Model::isPermitted( 'Leads', 'CreateView' ) ) {
				$modules[] = 'Leads';
			}
			if ( Users_Privileges_Model::isPermitted( 'Contacts', 'CreateView' ) ) {
				$modules[] = 'Contacts';
			}
			if ( Users_Privileges_Model::isPermitted( 'Accounts', 'CreateView' ) ) {
				$modules[] = 'Accounts';
			}
		}

		return $modules;

	}

	public static function SaveRecordModules( $data ) {
		$instance = new self();
		$record   = false;
		if ( $instance->showPopup === true ) {
			switch ( $data['module_name'] ) {
				case 'Contacts':
					$focus                             = CRMEntity::getInstance( 'Contacts' );
					$focus->mode                       = 'create';
					$focus->column_fields['firstname'] = isset( $data['name'] ) ? $data['name'] : '';
					$focus->column_fields['lastname']  = $data['last_name'];
					$focus->column_fields['mobile']    = $data['phone_number'];
					$focus->save( "Contacts" );

					return $focus->id;
					break;
				case 'Leads':
					$focus                             = CRMEntity::getInstance( 'Leads' );
					$focus->mode                       = 'create';
					$focus->column_fields['firstname'] = isset( $data['name'] ) ? $data['name'] : '';
					$focus->column_fields['lastname']  = $data['last_name'];
					$focus->column_fields['phone']     = $data['phone_number'];
					$focus->save( "Leads" );

					return $focus->id;
					break;
				case 'Accounts':
					$focus                                = CRMEntity::getInstance( 'Accounts' );
					$focus->mode                          = 'create';
					$focus->column_fields['tickersymbol'] = isset( $data['name'] ) ? $data['name'] : '';
					$focus->column_fields['accountname']  = $data['last_name'];
					$focus->column_fields['phone']        = $data['phone_number'];
					$focus->save( "Accounts" );

					return $focus->id;
					break;
			}

			return "NO";
		}

		return $record;

	}

}