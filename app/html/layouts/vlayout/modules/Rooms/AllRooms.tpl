{*<!--
/* ********************************************************************************
 * The content of this file is subject to the VTFarsi.ir Modules License("License");
 * You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is VTFarsi.ir
 * Portions created by VTFarsi.ir. are Copyright(C) VTFarsi Team
 * All Rights Reserved.
 * ****************************************************************************** */
-->*}
<h3>{$ROOM_TYPE}<button title="Close" type="button" class="close pull-right">x</button></h3>
<div class="all-rooms-list">
    {if $All_ROOM_COUNT gt 0}
    <input type="text" id="search-room-in-all" placeholder="{vtranslate('LBL_SEARCH', 'Rooms')} {$ROOM_TYPE}"/>
    <ul>
        {foreach item=ROOM from=$All_ROOMS}
            <li data-record="{$ROOM.roomsid}" class="c-panel-room-title">
                <span class="separator">{$ROOM['room_type_alias']}</span>
                <span>{$ROOM.name}</span><label class="room-unread-number unread-number-{$ROOM.roomsid}"></label>
            </li>
        {/foreach}
    </ul>
    {/if}
</div>