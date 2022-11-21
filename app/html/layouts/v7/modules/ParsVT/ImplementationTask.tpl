{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is: vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
<link href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/implementation/vt-icons/style.css" rel="stylesheet">
<script type="text/javascript" src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/implementation/vuejs/vue.min.js"></script>
<style>.h_iframe-aparat_embed_frame{ position:relative; }.h_iframe-aparat_embed_frame .ratio{ display:block;width:100%;height:auto; }.h_iframe-aparat_embed_frame iframe{ position:absolute;top:0;left:0;width:100%;height:100%; }</style>
{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{if $CURRENT_USER_MODEL->get('language') eq 'fa_ir' or  $CURRENT_USER_MODEL->get('language') eq 'fa_af'}
	{assign  var="left" value="right"}
	{assign  var="right" value="left"}
	<link rel="stylesheet" type="text/css" href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/implementation/styles/style.rtl.css">
{else}
	{assign  var="left" value="left"}
	{assign  var="right" value="right"}
	<link rel="stylesheet" type="text/css" href="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/implementation/styles/style.css">
{/if}

{strip}
	<div id="impTaskMain">
		<div class="modal-content">
			<div class="modal-header">
				<div class="row">
					<div class="col-md-10">
						<h3 class="pull-left textOverflowEllipsis m-xy-0 modal-title">
							{literal}
								<span v-show="view === 'track' || view === 'teamScore'">
									<i class="fa fa-arrow-left cursorPointer f-24 alignMiddle" v-on:click='goBack()'></i>&nbsp;&nbsp;
								</span>
								{{headerTitle}}
							{/literal}
						</h3>
						{literal}
							<span class="f-w f-16 display-inline-block" style="margin-top: 2px;" v-show="showTrackLabel && view === 'track'">
								&nbsp;>&nbsp;{{activeCategory}}&nbsp;>&nbsp;{{activeSubCategory}}
							</span>
						{/literal}
					</div>
					<div class="col-md-2">
						<button type="button" class="close" aria-label="Close" data-dismiss="modal">
							<span aria-hidden="true" class='fa fa-close verticalAlignMiddleImp'></span>
						</button>
					</div>    
				</div>
			</div>
			<div class="modal-body">
				<input type="hidden" name="totalScore" value='{Vtiger_Functions::jsonEncode(ParsVT_ImplementationTask_Model::getScore(false, 2))}'/>
				<input type="hidden" name="allTasks" value='{Vtiger_Functions::jsonEncode(ParsVT_ImplementationTask_Model::getAllForUi())}'/>
				<input type="hidden" name="allNETasks" value='{Vtiger_Functions::jsonEncode(ParsVT_ImplementationTask_Model::getAllForUi(1))}'/>
				<input type="hidden" name="allETasks" value='{Vtiger_Functions::jsonEncode(ParsVT_ImplementationTask_Model::getAllForUi(2))}'/>
				<input type="hidden" name='learningTracksData' value='{Vtiger_Functions::jsonEncode($LEARNING_TRACK_DATA)}'/>
				<input type="hidden" name="alphabetColors" value='{Vtiger_Functions::jsonEncode(ParsVT_ImplementationTask_Model::getAlphabetsColorCodes())}'/>
				{if $CURRENT_USER->isAdminUser()}
					<input type="hidden" name='impTracksData' value='{Vtiger_Functions::jsonEncode($IMP_TRACK_DATA)}'/>
					<input type="hidden" name='impNETracksData' value='{Vtiger_Functions::jsonEncode($IMPNE_TRACK_DATA)}'/>
					<input type="hidden" name='impALLTracksData' value='{Vtiger_Functions::jsonEncode($IMPALL_TRACK_DATA)}'/>
					<input type="hidden" name='guidesCategory' value='{Vtiger_Functions::jsonEncode(ParsVT_ImplementationTask_Model::getGuidesCategory())}'/>
					<input type="hidden" name='categoryScores' value='{Vtiger_Functions::jsonEncode(ParsVT_ImplementationTask_Model::getScoreByCategory())}'/>
				{else}
					<input type="hidden" name='impTracksData' value='[]'/>
					<input type="hidden" name='impNETracksData' value='[]'/>
					<input type="hidden" name='impALLTracksData' value='[]'/>
					<input type="hidden" name='guidesCategory' value='[]'/>
					<input type="hidden" name='categoryScores' value='[]'/>
				{/if}
				
				<div class="row" v-show="view === 'main'">
					<div class="col-xs-12 p-x-16">
						<div class="col-xs-9" style="padding: 5px 0;">
							<strong class="pull-left">{vtranslate('Current Implementation', $MODULE)}&nbsp;&nbsp;</strong>
							<total-score v-bind:scores="totalScore"></total-score>
						</div>
						<div class="col-xs-3 p-xy-0">
							{assign var=TEAM_USERS value=ParsVT_ImplementationTask_Model::getTeamUsers()}
							{if !empty($TEAM_USERS)}
								<button type="button" id="userLearnScore" class="p-o-btn-sm pull-right" v-on:click='showLearningBoard()'>
									{if $CURRENT_USER->isAdminUser()}
										{vtranslate('View user learning board', $MODULE)}
									{else}
										{vtranslate('View team learning board', $MODULE)}
									{/if}
								</button>
							{/if}
						</div>
					</div>
					
					<div class="col-xs-12 p-x-16 b-t-1 m-t-16">
						{if $CURRENT_USER->isAdminUser()}
							<transition name="impTaskSidebar">
								<div v-show="showSideBar" class="col-xs-4 b-r-1 p-xy-0 p-t-16 p-r-16 impTaskSidebar">
									<div class="col-xs-12 p-xy-0 p-r-16">
										<div>{vtranslate('CRM Implementation Tracks', $MODULE)}</div>
										<div class="col-xs-12 p-x-0 p-y-8 existsinpackage">
											<sidebar-track v-for="track in impTracksData" :show="true" v-bind:trackdata="track" v-bind:class="[getActiveTrack() == track.name ? 'active' : '']" v-on:clicked='activateTrack(track.name)'></sidebar-track>
										</div>
									</div>
									<div class="col-xs-12 p-xy-0 p-r-16">
										<div>{vtranslate('My CRM Knowledge', $MODULE)}</div>
										<div class="col-xs-12 p-x-0 p-y-8 existsinpackage">
											<sidebar-track v-for="track in learningTracksData" :show="true" v-bind:trackdata="track" v-bind:class="[getActiveTrack() == track.name ? 'active' : '']" v-on:clicked='activateTrack(track.name)'></sidebar-track>
										</div>
									</div>
									{if !empty($IMPNE_TRACK_DATA)}
									<div class="col-xs-12 p-xy-0 p-r-16">
										<div>{vtranslate('More CRM Implementation Tracks', $MODULE)}</div>
										<div class="col-xs-12 p-x-0 p-y-8 notexistsinpackage">
											<sidebar-track v-for="track in impNETracksData" :show="false" v-bind:trackdata="track" v-bind:class="[getActiveTrackNotExists() == track.name ? 'active' : '']" v-on:clicked='activateTrackNotExists(track.name)'></sidebar-track>
											</div>
									</div>
									{/if}
								</div>
							</transition>
						{/if}
						<div v-bind:class="[showSideBar ? 'col-xs-8' : 'col-xs-12']" class="p-xy-16">
							{if $CURRENT_USER->isAdminUser()}
								<button class="p-o-btn-sm impTaskToggleSidebar" v-on:click="showSideBar = !showSideBar">
									<i v-bind:class="[showSideBar ? 'fa fa-chevron-left' : 'fa fa-chevron-right']" class="fa"></i>
								</button>
							{/if}
							<div class="row" style="width: 750px;margin: 0 auto;" v-show="hasTrackUnfinishedTasks()">
								<div class="col-xs-12 p-xy-0 taskBlock">
									<div class="col-xs-2 p-x-16 full-height">
										<i class="fa fa-chevron-left impTaskNavigator" v-bind:class="[getPrevTask() ? 'f-b cursorPointer' : 'cursorPointerNotAllowed']" v-on:click="navMode = 'prev';setActiveTask(getPrevTask())"></i>
									</div>
									<task-block v-bind:task="getActiveTask()" v-bind:trackscore="getActiveTrackScore()" v-bind:navmode='navMode' v-bind:alltasks="allTasks"></task-block>
									<div class="col-xs-2 p-x-16 full-height">
										<i class="fa fa-chevron-right impTaskNavigator" v-bind:class="[getNextTask() ? 'f-b cursorPointer' : 'cursorPointerNotAllowed']" v-on:click="navMode = 'next';setActiveTask(getNextTask())"></i>
									</div>
								</div>
							</div>
							<div class="row" v-show="!hasTrackUnfinishedTasks()">
								<div class="col-xs-12 p-xy-16">
									<center>
										<img src="layouts/{vglobal('default_layout')}/modules/ParsVT/resources/implementation/images/finish.gif" alt="Completed" style="height: 360px;width: auto;"/>
										<div class="f-w" style="position: absolute;top: 3%;left: 31%;font-size: 18px;color:#fe9413;width: 38%;">{vtranslate('Well done!', $MODULE)}</div>
										<div class="f-w f-16" style="position: absolute;top: 8%;left: 31%;width: 38%;color:#445480;">
											{if $CURRENT_USER->isAdminUser()}
												{vtranslate('All tasks in this track have been completed', $MODULE)}
											{else}
												{vtranslate('All learning tasks have been completed', $MODULE)}
											{/if}
										</div>
										<div class="m-t-32">
											<a class="p-o-btn-sm" v-on:click="showAllTasks()">{vtranslate('Show all tasks', $MODULE)}</a>
										</div>
									</center>
								</div>
							</div>
						</div>
					</div>
				</div>
		
				<div class="row" v-show="view === 'track'">
					<div class="col-xs-12 p-x-0">
						<div class="col-xs-12 p-x-0 p-y-8">
							{if $CURRENT_USER->isAdminUser()}
								<transition name="impTaskSidebar">
									<div class="col-xs-4 p-x-0 p-l-16 b-r-1 trackSideBar overflowYAuto" v-show="trackViewSidebar && trackSidebarCollapse">
										<sidebar-category v-for='(subcategories, category) in activeTrackCategories' v-bind:name='category' v-bind:subcategories='subcategories'></sidebar-category>
									</div>
								</transition>
							{/if}
							<div v-bind:class="[(trackViewSidebar && trackSidebarCollapse) ? 'col-xs-8' : 'col-xs-12']" class="p-xy-0">
								{if $CURRENT_USER->isAdminUser()}
									<button class="p-o-btn-sm impTaskToggleSidebar trackSidebarToggle" v-show='trackSidebarCollapse' v-on:click="toggleTrackSidebar()">
										<i v-bind:class="[trackViewSidebar ? 'fa-chevron-left' : 'fa-chevron-right']" class="fa"></i>
									</button>
								{/if}
								<div class="col-xs-12 p-x-16 p-b-16">
									<div class="col-xs-3 p-x-0 pull-right">
										<div class="dropdown pull-right full-width">
											<button type="button" class="s-btn dropdown-toggle full-width" data-toggle="dropdown">
												<span class='pull-left'>
													<i class="fa fa-filter p-r-8 alignMiddle display-inline-block"></i>
													{literal}{{filterLabel}}{/literal}
												</span>
												<span class="pull-right">
													<i class="fa fa-angle-down alignMiddle display-inline-block"></i>
												</span>
											</button>
											<ul class="dropdown-menu full-width filterDropdown">
												<li><a data-name="all" data-label='{vtranslate('All tasks', $MODULE)}' v-on:click="filterTasks('all')">{vtranslate('All tasks', $MODULE)}</a></li>
												<li><a data-name="open" data-label='{vtranslate('Open tasks', $MODULE)}' v-on:click="filterTasks('open')">{vtranslate('Open tasks', $MODULE)}</a></li>
												<li><a data-name="completed" data-label='{vtranslate('Completed tasks', $MODULE)}' v-on:click="filterTasks('completed')">{vtranslate('Completed tasks', $MODULE)}</a></li>
												<li><a data-name="skipped" data-label='{vtranslate('Skipped tasks', $MODULE)}' v-on:click="filterTasks('skipped')">{vtranslate('Skipped tasks', $MODULE)}</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div v-show="activeTrackTasks.length" class="col-xs-12 p-x-0 p-r-16 trackTasks overflowYAuto">
									<div v-bind:class="[(trackViewSidebar && trackSidebarCollapse) ? 'col-xs-6' : 'col-xs-4']" class="p-x-0 p-l-16 p-b-16" v-for="trackTask in activeTrackTasks">
										<task v-bind:data="trackTask"></task>
									</div>
								</div>
								<div class="col-xs-12 p-x-0 p-r-16 trackTasks" v-show="!activeTrackTasks.length">
									<div class="col-xs-12 p-x-0 f-16 textAlignCenter" style="margin-top: 15%;" v-show="!activeTrackTasks.length && filterName === 'open'">{vtranslate('No more open tasks', $MODULE)}</div>
									<div class="col-xs-12 p-x-0 f-16 textAlignCenter" style="margin-top: 15%;" v-show="!activeTrackTasks.length && filterName === 'completed'">{vtranslate('No tasks are completed', $MODULE)}</div>
									<div class="col-xs-12 p-x-0 f-16 textAlignCenter" style="margin-top: 15%;" v-show="!activeTrackTasks.length && filterName === 'skipped'">{vtranslate('No tasks are skipped', $MODULE)}</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				<div class="row" v-show="view === 'teamScore'">
					<div class="col-xs-12 p-x-0">
						<div class="col-xs-12 p-x-16">
							<div class="col-xs-4 p-x-0">&nbsp;</div>
							<div class="col-xs-4 p-x-24">
								<input type="text" class="full-width" v-model.trim='teamScoreSearchKey' placeholder="{vtranslate('Type to search', $MODULE)}" style="border: thin solid #CCC !important;padding: 4px 8px !important;"/>
								<i class="fa fa-search f-gr" style="position: absolute;{$left}: 5%;top: 27%;"></i>
							</div>
							<div class="col-xs-4 p-x-0">
								<div class="col-xs-8 p-x-0 pull-right">
									<div class="dropdown pull-right full-width">
										<button type="button" class="s-btn dropdown-toggle full-width" data-toggle="dropdown">
											<span class='pull-left'>
												<i class="fa fa-sort alignMiddle display-inline-block"></i>
												<i class="fa fa-arrow-down p-r-8 alignMiddle display-inline-block" v-show="sortName === 'asc'"></i>
												<i class="fa fa-arrow-up p-r-8 alignMiddle display-inline-block" v-show="sortName === 'desc'"></i>
												{literal}{{sortLabel}}{/literal}
											</span>
											<span class="pull-right">
												<i class="fa fa-angle-down alignMiddle display-inline-block"></i>
											</span>
										</button>
										<ul class="dropdown-menu full-width sortDropdown">
											<li><a data-name="asc" data-label='{vtranslate('Sort by ascending', $MODULE)}' v-on:click="sortUser('asc')">{vtranslate('Sort by ascending', $MODULE)}</a></li>
											<li><a data-name="desc" data-label='{vtranslate('Sort by descending', $MODULE)}' v-on:click="sortUser('desc')">{vtranslate('Sort by descending', $MODULE)}</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
						<div class="col-xs-12 p-x-0 m-t-8 b-t-1 p-y-16 p-r-16 overflowYAuto teamBoard summaryWidgetContainer">
							<div class="col-xs-12 p-x-0" v-show='Object.keys(filteredTeamData).length'>
								<user-card v-for='user in filteredTeamData' v-bind:data='user'></user-card>
							</div>
							<div class="col-xs-12 p-x-0" v-show='!Object.keys(filteredTeamData).length'>
								<div class="emptyRecordsDiv">{vtranslate('No users found', $MODULE)}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript">
	var ParsVTImplementationTaskLang = {
		"SALES": "{vtranslate('Sales', $MODULE)}",
		"MARKETING": "{vtranslate('Marketing', $MODULE)}",
		"SUPPORT": "{vtranslate('Support', $MODULE)}",
		"ESSENTIALS": "{vtranslate('Essentials', $MODULE)}",
		"INVENTORY": "{vtranslate('Inventory', $MODULE)}",
		"PROJECTS": "{vtranslate('Projects', $MODULE)}",
	};
	var PVTHelpers = {
		tr1: "{vtranslate('Related Videos', $MODULE)}",
		tr2: "{vtranslate('Ticket was successfully sent', $MODULE)}",
		tr3: "{vtranslate('Send new ticket failed', $MODULE)}",
		tr4: "{vtranslate('View ticket', $MODULE)}",
		tr5: "{vtranslate('Main Menu', $MODULE)}",
		tr6: "{vtranslate('Video Tutorials', $MODULE)}",
		tr7: "{vtranslate('Submit Support Ticket', $MODULE)}",
		tr8: "{vtranslate('Update videos', $MODULE)}",
		tr9: "{vtranslate('Other videos of this section', $MODULE)}",
	};
</script>
{/strip}
