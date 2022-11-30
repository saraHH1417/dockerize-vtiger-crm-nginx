{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}

{**PVTPATCHER-AE749120F4E82DE0A20518B2CC591786-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
<div style='padding:5px;'>
{** REPLACED-AE749120F4E82DE0A20518B2CC591786// <div style='padding:5px;'>**}
{**PVTPATCHER-AE749120F4E82DE0A20518B2CC591786-FINISH**}
	{if $HISTORIES neq false}
		{foreach key=$index item=HISTORY from=$HISTORIES}
			{assign var=MODELNAME value=get_class($HISTORY)}
			{if $MODELNAME == 'ModTracker_Record_Model'}
				{assign var=USER value=$HISTORY->getModifiedBy()}
				{assign var=TIME value=$HISTORY->getActivityTime()}
				{assign var=PARENT value=$HISTORY->getParent()}
				{assign var=MOD_NAME value=$HISTORY->getParent()->getModule()->getName()}
				{assign var=SINGLE_MODULE_NAME value='SINGLE_'|cat:$MOD_NAME}
				{assign var=TRANSLATED_MODULE_NAME value = vtranslate($MOD_NAME ,$MOD_NAME)}
				{assign var=PROCEED value= TRUE}
				{if ($HISTORY->isRelationLink()) or ($HISTORY->isRelationUnLink())}
					{assign var=RELATION value=$HISTORY->getRelationInstance()}
					{if !($RELATION->getLinkedRecord())}
						{assign var=PROCEED value= FALSE}
					{/if}
				{/if}
				{if $PROCEED}
					<div class="row entry clearfix">
						<div class='col-lg-1 pull-left'>
							{assign var=VT_ICON value=$MOD_NAME}
							{if $MOD_NAME eq "Events"}
								{assign var="TRANSLATED_MODULE_NAME" value="Calendar"}
								{assign var=VT_ICON value="Calendar"}
							{else if $MOD_NAME eq "Calendar"}
								{assign var=VT_ICON value="Task"}
							{/if}
							<span>{$HISTORY->getParent()->getModule()->getModuleIcon($VT_ICON)}</span>&nbsp;&nbsp;
						</div>
						<div class="col-lg-10 pull-left">
							{assign var=DETAILVIEW_URL value=$PARENT->getDetailViewUrl()}
							{if $HISTORY->isUpdate()}
								{assign var=FIELDS value=$HISTORY->getFieldInstances()}
								<div>
									{**PVTPATCHER-F44AD9F0D796A8FE1565502C1017F7AC-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
									{if stripos($DETAILVIEW_URL, 'javascript:')===0}
									{assign var=CHANGEDLINK value="onclick='{$DETAILVIEW_URL|substr:strlen('javascript:')}'"}  
									{else}
									{assign var=CHANGEDLINK value="onclick='window.location.href=\"{$DETAILVIEW_URL}\"'"}  
									{/if}
									{vtranslate('%s Updated by %s', "ParsVT", "<a class=\"cursorPointer\" {$CHANGEDLINK}>{$PARENT->getName()}</a>", "<b>{$USER->getName()}</b>")}
							{else}
									<div><b>{$USER->getName()}</b> {vtranslate('LBL_UPDATED')}
{** REPLACED-F44AD9F0D796A8FE1565502C1017F7AC// <div><b>{$USER->getName()}</b> {vtranslate('LBL_UPDATED')}**}
{**PVTPATCHER-F44AD9F0D796A8FE1565502C1017F7AC-FINISH**} <a class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0}
																								  onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>
											{$PARENT->getName()}</a>
									</div>
									{**PVTPATCHER-8D5E74160C4602061357BB507547D74D-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{/if}
									{foreach from=$FIELDS key=INDEX item=FIELD}
{** REPLACED-8D5E74160C4602061357BB507547D74D// {foreach from=$FIELDS key=INDEX item=FIELD}**}
{**PVTPATCHER-8D5E74160C4602061357BB507547D74D-FINISH**}
										{if $INDEX lt 2}
											{if $FIELD && $FIELD->getFieldInstance() && $FIELD->getFieldInstance()->isViewableInDetailView()}
												<div>
													<i>{vtranslate($FIELD->getName(), $FIELD->getModuleName())}</i>
													{if $FIELD->get('prevalue') neq '' && $FIELD->get('postvalue') neq '' && !($FIELD->getFieldInstance()->getFieldDataType() eq 'reference' && ($FIELD->get('postvalue') eq '0' || $FIELD->get('prevalue') eq '0'))}
														&nbsp;{vtranslate('LBL_FROM')} <b>{Vtiger_Util_Helper::toVtiger6SafeHTML($FIELD->getDisplayValue(decode_html($FIELD->get('prevalue'))))}</b>
													{else if $FIELD->get('postvalue') eq '' || ($FIELD->getFieldInstance()->getFieldDataType() eq 'reference' && $FIELD->get('postvalue') eq '0')}
														&nbsp; <b> {vtranslate('LBL_DELETED')} </b> ( <del>{Vtiger_Util_Helper::toVtiger6SafeHTML($FIELD->getDisplayValue(decode_html($FIELD->get('prevalue'))))}</del> )
													{else}
														&nbsp;{vtranslate('LBL_CHANGED')}
													{/if}
													{if $FIELD->get('postvalue') neq '' && !($FIELD->getFieldInstance()->getFieldDataType() eq 'reference' && $FIELD->get('postvalue') eq '0')}
														{vtranslate('LBL_TO')} <b>{Vtiger_Util_Helper::toVtiger6SafeHTML($FIELD->getDisplayValue(decode_html($FIELD->get('postvalue'))))}</b>
													{/if}    
												</div>
											{/if}
										{else}
											<a href="{$PARENT->getUpdatesUrl()}">{vtranslate('LBL_MORE')}</a>
											{break}
										{/if}
									{/foreach}
								</div>
							{**PVTPATCHER-F59907D9763D24C428B793882CC5D64B-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{else if $HISTORY->isCreate()}
                							{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
									{if stripos($DETAILVIEW_URL, 'javascript:')===0}
									{assign var=CHANGEDLINK value="onclick='{$DETAILVIEW_URL|substr:strlen('javascript:')}'"}  
									{else}
									{assign var=CHANGEDLINK value="onclick='window.location.href=\"{$DETAILVIEW_URL}\"'"}  
									{/if}
                                                                        <div>
									{vtranslate('%s Added by %s', "ParsVT", "<a class=\"cursorPointer\" {$CHANGEDLINK}>{$PARENT->getName()}</a>", "<b>{$USER->getName()}</b>")}
                                                                        </div>
							{else}
{** REPLACED-F59907D9763D24C428B793882CC5D64B// {else if $HISTORY->isCreate()}**}
{**PVTPATCHER-F59907D9763D24C428B793882CC5D64B-FINISH**}
								<div>
									<b>{$USER->getName()}</b> {vtranslate('LBL_ADDED')} 
									<a class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0} onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>{$PARENT->getName()}</a>
								</div>
							{**PVTPATCHER-B60A1CBD94CDC9284A1909BDA7454BB8-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{/if}
							{else if ($HISTORY->isRelationLink() || $HISTORY->isRelationUnLink())}
{** REPLACED-B60A1CBD94CDC9284A1909BDA7454BB8// {else if ($HISTORY->isRelationLink() || $HISTORY->isRelationUnLink())}**}
{**PVTPATCHER-B60A1CBD94CDC9284A1909BDA7454BB8-FINISH**}
								{assign var=RELATION value=$HISTORY->getRelationInstance()}
								{assign var=LINKED_RECORD_DETAIL_URL value=$RELATION->getLinkedRecord()->getDetailViewUrl()}
								{**PVTPATCHER-612651577CB993B96FA155F2185DA0C1-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{assign var=PARENT_DETAIL_URL value=$RELATION->getParent()->getParent()->getDetailViewUrl()}
                							{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
                                <div>
                                    {if $RELATION->getLinkedRecord()->getModuleName() eq 'Calendar'}
                                        {if isPermitted('Calendar', 'DetailView', $RELATION->getLinkedRecord()->getId()) eq 'yes'}
                                                   {if stripos($LINKED_RECORD_DETAIL_URL, 'javascript:')===0}
                                                        {assign var=LINKEDRECORDURL value="<a class='cursorPointer' onclick='{$LINKED_RECORD_DETAIL_URL|substr:strlen('javascript:')}'>{$RELATION->getLinkedRecord()->getName()}</a>"}
                                                   {else}
                                                        {assign var=LINKEDRECORDURL value="<a class='cursorPointer' onclick='window.location.href=\"{$LINKED_RECORD_DETAIL_URL}\"'>{$RELATION->getLinkedRecord()->getName()}</a>"}
                                                   {/if}
                                        {else}
                                            {assign var=LINKEDRECORDURL value="{vtranslate($RELATION->getLinkedRecord()->getModuleName(), $RELATION->getLinkedRecord()->getModuleName())}"}

                                            
                                        {/if}
                                    {else if $RELATION->getLinkedRecord()->getModuleName() == 'ModComments'}
                                         {assign var=LINKEDRECORDURL value="<i>\"{$RELATION->getLinkedRecord()->getName()}\"</i>"}

                                        
                                    {else}
                                       {if stripos($LINKED_RECORD_DETAIL_URL, 'javascript:')===0}
                                         {assign var=LINKEDRECORDURL value="<a class='cursorPointer' onclick='{$LINKED_RECORD_DETAIL_URL|substr:strlen('javascript:')}'>{$RELATION->getLinkedRecord()->getName()}</a>"}
                                       {else}
                                         {assign var=LINKEDRECORDURL value="<a class='cursorPointer' onclick='window.location.href=\"{$LINKED_RECORD_DETAIL_URL}\"'>{$RELATION->getLinkedRecord()->getName()}</a>"}
                                       {/if}

                                    {/if}
                                    
                                    {if stripos($PARENT_DETAIL_URL, 'javascript:')===0}
                                	{assign var=FORRECORD value="<a class='cursorPointer'  onclick='{$PARENT_DETAIL_URL|substr:strlen('javascript:')}'>{$RELATION->getParent()->getParent()->getName()}</a>"}
                                	{else}
                                	{assign var=FORRECORD value="<a class='cursorPointer'  onclick='window.location.href=\"{$PARENT_DETAIL_URL}\"'>{$RELATION->getParent()->getParent()->getName()}</a>"}
                                	{/if}
                                	
                                    {if $HISTORY->isRelationLink()}
                                        {vtranslate('%s Added for %s by %s', 'ParsVT', $LINKEDRECORDURL  ,$FORRECORD, "<b>{$USER->getName()}</b>")}
                                    {else}
                                        {vtranslate('%s Removed for %s by %s', 'ParsVT', $LINKEDRECORDURL  ,$FORRECORD, "<b>{$USER->getName()}</b>")}
                                    {/if}

                                </div>
                        {else}
{** REPLACED-612651577CB993B96FA155F2185DA0C1// {assign var=PARENT_DETAIL_URL value=$RELATION->getParent()->getParent()->getDetailViewUrl()}**}
{**PVTPATCHER-612651577CB993B96FA155F2185DA0C1-FINISH**}
								<div>
									<b>{$USER->getName()}</b>
									{if $HISTORY->isRelationLink()}
										{vtranslate('LBL_ADDED', $MODULE_NAME)}
									{else}
										{vtranslate('LBL_REMOVED', $MODULE_NAME)}
									{/if}
									{if $RELATION->getLinkedRecord()->getModuleName() eq 'Calendar'}
										{if isPermitted('Calendar', 'DetailView', $RELATION->getLinkedRecord()->getId()) eq 'yes'}
											<a class="cursorPointer" {if stripos($LINKED_RECORD_DETAIL_URL, 'javascript:')===0} onclick='{$LINKED_RECORD_DETAIL_URL|substr:strlen("javascript:")}'
											{else} onclick='window.location.href="{$LINKED_RECORD_DETAIL_URL}"' {/if}>{$RELATION->getLinkedRecord()->getName()}</a>
									{else}
										{vtranslate($RELATION->getLinkedRecord()->getModuleName(), $RELATION->getLinkedRecord()->getModuleName())}
									{/if}
								{else if $RELATION->getLinkedRecord()->getModuleName() == 'ModComments'}
									<i>"{$RELATION->getLinkedRecord()->getName()}"</i>
								{else}
									<a class="cursorPointer" {if stripos($LINKED_RECORD_DETAIL_URL, 'javascript:')===0} onclick='{$LINKED_RECORD_DETAIL_URL|substr:strlen("javascript:")}'
									{else} onclick='window.location.href="{$LINKED_RECORD_DETAIL_URL}"' {/if}>{$RELATION->getLinkedRecord()->getName()}</a>
							{/if}{vtranslate('LBL_FOR')} <a class="cursorPointer" {if stripos($PARENT_DETAIL_URL, 'javascript:')===0}
							   onclick='{$PARENT_DETAIL_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$PARENT_DETAIL_URL}"' {/if}>
									{$RELATION->getParent()->getParent()->getName()}</a>
							</div>
						{**PVTPATCHER-0B95249DB899D4C2C07D30D7B0E06F76-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{/if}
						{else if $HISTORY->isRestore()}
{** REPLACED-0B95249DB899D4C2C07D30D7B0E06F76// {else if $HISTORY->isRestore()}**}
{**PVTPATCHER-0B95249DB899D4C2C07D30D7B0E06F76-FINISH**}
							<div>
								{**PVTPATCHER-F989E39B4DD192F5CF5065090F6254A4-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
							             	{if stripos($DETAILVIEW_URL, 'javascript:')===0}
								                {assign var=SHOWRESTOREURL value="<a class='cursorPointer'  onclick='{$DETAILVIEW_URL|substr:strlen('javascript:')}'>{$PARENT->getName()}</a>"}
							            	{else}
								                {assign var=SHOWRESTOREURL value="<a class='cursorPointer'  onclick='window.location.href=\"{$DETAILVIEW_URL}\"'>{$PARENT->getName()}</a>"}
							            	{/if}
								            {vtranslate('%s Restored by %s', 'ParsVT', $SHOWRESTOREURL , "<b>{$USER->getName()}</b>")}
                                                                         </div>
                                                                         {else}
                                                                         <b>{$USER->getName()}</b> {vtranslate('LBL_RESTORED')}
{** REPLACED-F989E39B4DD192F5CF5065090F6254A4// <b>{$USER->getName()}</b> {vtranslate('LBL_RESTORED')}**}
{**PVTPATCHER-F989E39B4DD192F5CF5065090F6254A4-FINISH**} <a class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0}
																						  onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>
									{$PARENT->getName()}</a>
							</div>
						{**PVTPATCHER-111C6E3293E779E6EC3E2F284D92512C-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{/if}
                                                                         {else if $HISTORY->isDelete()}
{** REPLACED-111C6E3293E779E6EC3E2F284D92512C// {else if $HISTORY->isDelete()}**}
{**PVTPATCHER-111C6E3293E779E6EC3E2F284D92512C-FINISH**}
							<div>
								{**PVTPATCHER-7BE8357076D9EE5DFDE00848EBE09484-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
                                                                             {vtranslate('%s Deleted by %s', 'ParsVT', $PARENT->getName() , "<strong>{$USER->getName()}</strong>")}
                                                                        {else}
                                                                             <b>{$USER->getName()}</b> {vtranslate('LBL_DELETED')}
{** REPLACED-7BE8357076D9EE5DFDE00848EBE09484// <b>{$USER->getName()}</b> {vtranslate('LBL_DELETED')}**}
{**PVTPATCHER-7BE8357076D9EE5DFDE00848EBE09484-FINISH**} 
								{**PVTPATCHER-7DADD039AE471DBCB5897FF100DED35F-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
<strong> {$PARENT->getName()}</strong>
                                                                         {/if}
{** REPLACED-7DADD039AE471DBCB5897FF100DED35F// <strong> {$PARENT->getName()}</strong>**}
{**PVTPATCHER-7DADD039AE471DBCB5897FF100DED35F-FINISH**}
							</div>
						{/if}
					</div>
					{if $TIME}<p class="pull-right muted" style="padding-right:10px;"><small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString("$TIME")}">{Vtiger_Util_Helper::formatDateDiffInStrings("$TIME")}</small></p>{/if}
				</div>
			{/if}
			{else if $MODELNAME == 'ModComments_Record_Model'}
				<div class="row">
					<div class="col-lg-1 pull-left">
						<span><i class="vicon-chat entryIcon" title={$TRANSLATED_MODULE_NAME}></i></span>
					</div>
					<div class="col-lg-10 pull-left" style="margin-top:5px;">
						{assign var=COMMENT_TIME value=$HISTORY->getCommentedTime()}
						<div>
							{**PVTPATCHER-721E1F54742AA418DDA98C2A2E2CF263-START-theme730**}
{** Don't remove the Start and Finish Markup! Modified: 2022-11-30 10:51:01 **}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
                                                                        {vtranslate('New comment for %s added by %s', 'ParsVT', "<a class='textOverflowEllipsis' href='{$HISTORY->getParentRecordModel()->getDetailViewUrl()}'>{$HISTORY->getParentRecordModel()->getName()}</a>" , "<b>{$HISTORY->getCommentedByName()}</b>")}
                                                                         {else}
                                                                         <b>{$HISTORY->getCommentedByName()}</b> {vtranslate('LBL_COMMENTED')} {vtranslate('LBL_ON')} <a class="textOverflowEllipsis" href="{$HISTORY->getParentRecordModel()->getDetailViewUrl()}">{$HISTORY->getParentRecordModel()->getName()}</a>
                                                                         {/if}
{** REPLACED-721E1F54742AA418DDA98C2A2E2CF263// <b>{$HISTORY->getCommentedByName()}</b> {vtranslate('LBL_COMMENTED')} {vtranslate('LBL_ON')} <a class="textOverflowEllipsis" href="{$HISTORY->getParentRecordModel()->getDetailViewUrl()}">{$HISTORY->getParentRecordModel()->getName()}</a>**}
{**PVTPATCHER-721E1F54742AA418DDA98C2A2E2CF263-FINISH**}
						</div>
						<div><i>"{nl2br($HISTORY->get('commentcontent'))}"</i></div>
					</div>
					<p class="pull-right muted" style="padding-right:10px;"><small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString("$COMMENT_TIME")}">{Vtiger_Util_Helper::formatDateDiffInStrings("$COMMENT_TIME")}</small></p>
				</div>
			{/if}
		{/foreach}

		{if $NEXTPAGE}
			<div class="row">
				<div class="col-lg-12">
					<a href="javascript:;" class="load-more" data-page="{$PAGE}" data-nextpage="{$NEXTPAGE}">{vtranslate('LBL_MORE')}...</a>
				</div>
			</div>
		{/if}

	{else}
		<span class="noDataMsg">
			{if $HISTORY_TYPE eq 'updates'}
				{vtranslate('LBL_NO_UPDATES', $MODULE_NAME)}
			{elseif $HISTORY_TYPE eq 'comments'}
				{vtranslate('LBL_NO_COMMENTS', $MODULE_NAME)}
			{else}
				{vtranslate('LBL_NO_UPDATES_OR_COMMENTS', $MODULE_NAME)}
			{/if}
		</span>
	{/if}
</div>
