{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<section id="collaboration-history">
    <header class="collaboration-history-header">
        <h2>{vtranslate('LBL_HISTORY', 'Rooms')}</h2>
    </header>
    <div class="collaboration-history-search-box">
        <select id="history-type" class="chzn-select">
            <option value="R">{vtranslate('LBL_HISTORY_TYPE_ROOM', 'Rooms')}</option>
            <option value="M">{vtranslate('LBL_HISTORY_TYPE_MESSAGE', 'Rooms')}</option>
        </select>
        <input type="text" id="history-search-box" placeholder="{vtranslate('LBL_SEARCH', 'Rooms')}" />
        <i class="icon-search "></i>
    </div>
    <div class="collaboration-history-result">

    </div>
</section>