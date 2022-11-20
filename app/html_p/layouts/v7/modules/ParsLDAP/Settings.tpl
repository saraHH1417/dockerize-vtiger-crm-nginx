{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
{strip}
    <div class="editViewPageDiv " id="editViewContent">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 ">
            <div class="contents">
                <div>
                    <h4>{vtranslate('LDAP Authentication Configuration',$module)}</h4>
                </div>
                <hr>
                <br>
                {if $EXTENSION}
                    <div class="alert alert-danger" style="text-align: center">{$EXTENSIONMSG}</div>
                {elseif $ldap_installed eq "no"}
                    <div id="PARSLDAPINSTALL" class="alert alert-danger" style="text-align: center">{vtranslate('LDAP Modifications Not Currently Installed',$module)}
                        <br/>
                        <span id="installLDAP"
                              style="cursor: pointer">{vtranslate('Authentication will not work until this process is completed, please Click Here to Install.',$module)}</span><br/>
                    </div>
                {else}
                    <form name="cfgForm" class="form-horizontal" action="index.php" method="POST">
                        <input type="hidden" name="module" value="ParsLDAP">
                        <input type="hidden" name="parent" value="Settings">
                        <input type="hidden" name="view" value="Settings">
                        <input type="hidden" name="action" value="Save">
                        <div class="detailViewInfo" id="ldapmethod">
                            <div class="row form-group">
                                <div class="col-lg-4 control-label fieldLabel">
                                    <label>{vtranslate('Authentication Meothd:',$module)}</label>
                                </div>
                                <div class="{$WIDTHTYPE}  col-lg-4 input-group">
                                    <select class="select2-container inputElement select2 col-lg-11"
                                            name="ldap_authtype" id="ldap_authtype">
                                        {$ldap_authtype}
                                    </select>
                                </div>
                            </div>
                        </div>
                        {foreach key=KEY item=VALUES from=$DATA}
                            <div class="detailViewInfo"
                                 id="{$VALUES['id']}" {if $ldap_which eq $KEY} style="display: block" {else} style="display: none" {/if}>
                                {foreach item=FIELD_DETAILS from=$VALUES['fields']}
                                    <div class="row form-group">
                                        <div class="col-lg-4 control-label fieldLabel">
                                            <label>{vtranslate($FIELD_DETAILS['label'], $QUALIFIED_MODULE)}</label>
                                        </div>
                                        <div class="{$WIDTHTYPE}  col-lg-4 input-group">
                                            {if $FIELD_DETAILS['fieldType'] == 'picklist'}
                                                <select class="select2-container inputElement select2 col-lg-11"
                                                        name="{$FIELD_DETAILS['name']}">
                                                    {$FIELD_DETAILS['value']}
                                                </select>
                                                <br/>
                                                {$FIELD_DETAILS['placeholder']}
                                            {else if $FIELD_DETAILS['fieldType'] == 'checkbox'}
                                                <div class=" ">
                                                    <input type="checkbox" name="{$FIELD_DETAILS['name']}"
                                                           value="{$FIELD_DETAILS['value']}" {$FIELD_DETAILS['checked']} /> {$FIELD_DETAILS['placeholder']}
                                                </div>
                                            {else if $FIELD_DETAILS['fieldType'] == 'textarea'}
                                                <textarea name="{$FIELD_DETAILS['name']}" class="inputElement fields"
                                                          style="min-height: 100px; direction: ltr; text-align: left"
                                                          placeholder="{$FIELD_DETAILS['placeholder']}">{$FIELD_DETAILS['value']}</textarea>
                                            {else}
                                                <div class=" input-group inputElement">
                                                    <input style="direction: ltr; text-align: left"
                                                           type="{$FIELD_DETAILS['fieldType']}" class="inputElement "
                                                           name="{$FIELD_DETAILS['name']}"
                                                           data-rule-required="true" value="{$FIELD_DETAILS['value']}"
                                                           placeholder="{$FIELD_DETAILS['placeholder']}"/>
                                                </div>
                                            {/if}
                                        </div>
                                    </div>
                                {/foreach}
                                <div class="row form-group">
                                    <div class="col-lg-8 control-label fieldLabel">
                                        <a href="{$VALUES['help']}" target="_blank">{vtranslate('Wiki', $MODULE)}</a>
                                    </div>
                                </div>
                                <div class="row form-group">
                                    <div class="col-lg-2 control-label fieldLabel">
                                    </div>
                                    <div class="col-lg-8 control-label fieldLabel">
                                        <div class="alert alert-info">{vtranslate('NOTE: the user "admin" will always be able to login using the SQL password, regardless if this user is in LDAP or AD', $MODULE)}</div>
                                    </div>
                                    <div class="col-lg-2 control-label fieldLabel">
                                    </div>
                                </div>
                            </div>
                        {/foreach}

                        <div class='modal-overlay-footer clearfix'>
                            <div class=" row clearfix">
                                <div class=' textAlignCenter col-lg-12 col-md-12 col-sm-12 '>
                                    <button type='submit' class='btn btn-success saveButton'>{vtranslate('LBL_SAVE', $MODULE)}</button>&nbsp;&nbsp;&nbsp;
                                    {if $ldap_which eq 'LDAP' or $ldap_which eq 'AD'}
                                    <button type='button' class='btn btn-info TestLDAPBTN'>{vtranslate('Test Configuration', $MODULE)}</button>&nbsp;&nbsp;
                                    {/if}
                                    <a class='cancelLink' href="index.php?module=Vtiger&parent=Settings&view=Index">{vtranslate('LBL_CANCEL', $MODULE)}</a>

                                </div>
                            </div>
                        </div>
                    </form>
                {/if}
            </div>
        </div>
    </div>
{/strip}