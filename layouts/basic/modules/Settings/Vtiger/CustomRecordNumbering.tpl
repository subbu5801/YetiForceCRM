{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
* Contributor(s): YetiForce.com
********************************************************************************/
-->*}
{strip}
	<div class="tpl-Settings-Vtiger-CustomRecordNumbering">
		<form id="EditView" method="POST">
			<div class="widget_header row mb-3">
				<div class="col-6 col-md-9">
					<div class="d-inline-flex">
						{include file=\App\Layout::getTemplatePath('BreadCrumbs.tpl', $MODULE)}
					</div>
					<div class="d-inline-flex">
						<div class="js-popover-tooltip ml-2" data-js="popover"
							 data-content="{\App\Language::translate('LBL_CUSTOMIZE_MODENT_NUMBER_DESCRIPTION',$QUALIFIED_MODULE)}">
							<span class="fas fa-info-circle"></span>
						</div>
					</div>
				</div>
				<div class="col-6 col-md-3">
					<button type="button" class="btn btn-info float-right mt-1" name="updateRecordWithSequenceNumber">
						<span class="fas fa-exchange-alt u-mr-5px"></span>{\App\Language::translate('LBL_UPDATE_MISSING_RECORD_SEQUENCE', $QUALIFIED_MODULE)}
					</button>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						{assign var=DEFAULT_MODULE_NAME value=$DEFAULT_MODULE_MODEL->getName()}
						{assign var=DEFAULT_MODULE_DATA value=\App\Fields\RecordNumber::getNumber($DEFAULT_MODULE_NAME)}
						{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
						<thead>
						<tr>
							<th width="30%" class="{$WIDTHTYPE}">
								{\App\Language::translate('LBL_CUSTOMIZE_RECORD_NUMBERING', $QUALIFIED_MODULE)}
							</th>
							<th width="70%"></th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="{$WIDTHTYPE}">
								<label class="float-right"><b>{\App\Language::translate('LBL_SELECT_MODULE', $QUALIFIED_MODULE)}</b></label>
							</td>
							<td class="fieldValue {$WIDTHTYPE} border-left-0 position-relative">
								<select class="select2 form-control" name="sourceModule">
									{foreach key=index item=MODULE_MODEL from=$SUPPORTED_MODULES}
										{assign var=MODULE_NAME value=$MODULE_MODEL->get('name')}
										<option value={$MODULE_NAME} {if $MODULE_NAME eq $DEFAULT_MODULE_NAME} selected {/if}>
											{\App\Language::translate($MODULE_NAME, $MODULE_NAME)}
										</option>
									{/foreach}
								</select>
							</td>
						</tr>
						<tr>
							<td class="{$WIDTHTYPE}">
								<label class="float-right">
									<b>{\App\Language::translate('LBL_USE_PREFIX', $QUALIFIED_MODULE)}</b>
									<a href="#" class="js-popover-tooltip ml-2"
									   data-js="popover"
									   data-trigger="focus hover"
									   data-content="{\App\Language::translate('LBL_USE_PREFIX_INFO', $QUALIFIED_MODULE)}">
										<span class="fas fa-info-circle"></span>
									</a>
								</label>
							</td>
							<td class="fieldValue {$WIDTHTYPE} border-left-0 position-relative">
								<input type="text" class="form-control" value="{$DEFAULT_MODULE_DATA['prefix']}"
									   placeholder="{\App\Language::translate('LBL_NO_PREFIX', $QUALIFIED_MODULE)}"
									   data-old-prefix="{$DEFAULT_MODULE_DATA['prefix']}" name="prefix"
									   data-validation-engine="validate[funcCall[Vtiger_AlphaNumericWithSlashesCurlyBraces_Validator_Js.invokeValidation]]"/>
							</td>
						</tr>
						<tr>
							<td class="{$WIDTHTYPE}">
								<label class="float-right">
									<b>{\App\Language::translate("LBL_LEADING_ZEROS", $QUALIFIED_MODULE)}</b>
									<a href="#" class="js-popover-tooltip ml-2"
									   data-js="popover"
									   data-trigger="focus hover"
									   data-content="{\App\Language::translate('LBL_LEADING_ZEROS_INFO', $QUALIFIED_MODULE)}">
										<span class="fas fa-info-circle"></span>
									</a>
								</label>
							</td>
							<td class="fieldValue {$WIDTHTYPE} border-left-0 position-relative">
								<select class="select2" name="leading_zeros">
									<option value="0"
											{if empty($DEFAULT_MODULE_DATA['leading_zeros'])}selected="selected"{/if}>
										{\App\Language::translate('LBL_NO_LEADING_ZEROS', $QUALIFIED_MODULE)}&nbsp;
										({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										2, 6, 88, 954, 1549)
									</option>
									<option value="2"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===2}selected="selected"{/if}>
										2 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										02, 06, 88, 954, 1549)
									</option>
									<option value="3"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===3}selected="selected"{/if}>
										3 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										002, 006, 088, 954, 1549)
									</option>
									<option value="4"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===4}selected="selected"{/if}>
										4 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										0002, 0006, 0088, 0954, 1549)
									</option>
									<option value="5"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===5}selected="selected"{/if}>
										5 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										00002, 00006, 00088, 00954, 01549)
									</option>
									<option value="6"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===6}selected="selected"{/if}>
										6 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										000002, 000006, 000088, 000954, 001549)
									</option>
									<option value="7"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===7}selected="selected"{/if}>
										7 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										0000002, 0000006, 0000088, 0000954, 0001549)
									</option>
									<option value="8"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===8}selected="selected"{/if}>
										8 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										00000002, 00000006, 00000088, 00000954, 00001549)
									</option>
									<option value="9"
											{if $DEFAULT_MODULE_DATA['leading_zeros']===9}selected="selected"{/if}>
										9 ({\App\Language::translate('LBL_FOR_EXAMPLE_SHORT',$QUALIFIED_MODULE)}&nbsp;
										000000002, 000000006, 000000088, 000000954, 000001549)
									</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="{$WIDTHTYPE}">
								<label class="float-right">
									<b>{\App\Language::translate('LBL_USE_POSTFIX', $QUALIFIED_MODULE)}</b>
									<a href="#" class="js-popover-tooltip ml-2"
									   data-js="popover"
									   data-trigger="focus hover"
									   data-content="{\App\Language::translate('LBL_USE_POSTFIX_INFO', $QUALIFIED_MODULE)}">
										<span class="fas fa-info-circle"></span>
									</a>
								</label>
							</td>
							<td class="fieldValue {$WIDTHTYPE} border-left-0 position-relative">
								<input type="text" class="form-control" value="{$DEFAULT_MODULE_DATA['postfix']}"
									   placeholder="{\App\Language::translate('LBL_NO_POSTFIX', $QUALIFIED_MODULE)}"
									   data-old-postfix="{$DEFAULT_MODULE_DATA['postfix']}" name="postfix"
									   data-validation-engine="validate[funcCall[Vtiger_AlphaNumericWithSlashesCurlyBraces_Validator_Js.invokeValidation]]"/>
							</td>
						</tr>

						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table class="table table-bordered">
						<thead>
						<tr>
							<th width="30%" class="{$WIDTHTYPE}">
								{\App\Language::translate('LBL_CUSTOMIZE_SEQUENCE', $QUALIFIED_MODULE)}
							</th>
							<th></th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="{$WIDTHTYPE}">
								<label class="float-right">
									<b>{\App\Language::translate('LBL_START_SEQUENCE', $QUALIFIED_MODULE)}</b><span
											class="redColor">*</span>
									<a href="#" class="js-popover-tooltip ml-2"
									   data-js="popover"
									   data-trigger="focus hover"
									   data-content="{\App\Language::translate('LBL_START_SEQUENCE_INFO', $QUALIFIED_MODULE)}">
										<span class="fas fa-info-circle"></span>
									</a>
								</label>
							</td>
							<td class="fieldValue {$WIDTHTYPE} border-left-0 position-relative">
								<input type="text" class="form-control" value="{$DEFAULT_MODULE_DATA['sequenceNumber']}"
									   data-old-sequence-number="{$DEFAULT_MODULE_DATA['sequenceNumber']}"
									   name="sequenceNumber"
									   data-validation-engine="validate[required,funcCall[Vtiger_WholeNumber_Validator_Js.invokeValidation]]"/>
							</td>
						</tr>
						<tr>
							<td class="{$WIDTHTYPE}">
								<label class="float-right">
									<b>{\App\Language::translate('LBL_RS_RESET_SEQUENCE', $QUALIFIED_MODULE)}</b>
									<a href="#" class="js-popover-tooltip ml-2"
									   data-js="popover"
									   data-trigger="focus hover"
									   data-content="{\App\Language::translate('LBL_RS_RESET_SEQUENCE_INFO', $QUALIFIED_MODULE)}">
										<span class="fas fa-info-circle"></span>
									</a>
								</label>
							</td>
							<td class="fieldValue {$WIDTHTYPE} border-left-0 position-relative">
								<select class="select2" name="reset_sequence" mand
										data-placeholder="{\App\Language::translate('LBL_RS_RESET_SEQUENCE', $QUALIFIED_MODULE)}">
									<option value="n" {if $DEFAULT_MODULE_DATA['reset_sequence']==='n' || empty($DEFAULT_MODULE_DATA['reset_sequence'])}selected{/if}>
										{\App\Language::translate('LBL_RS_DO_NOT_RESET', $QUALIFIED_MODULE)}
									</option>
									<option value="Y" {if $DEFAULT_MODULE_DATA['reset_sequence']==='Y'}selected{/if}>
										{\App\Language::translate('LBL_RS_YEAR',$QUALIFIED_MODULE)}
									</option>
									<option value="M" {if $DEFAULT_MODULE_DATA['reset_sequence']==='M'}selected{/if}>
										{\App\Language::translate('LBL_RS_MONTH',$QUALIFIED_MODULE)}
									</option>
									<option value="D" {if $DEFAULT_MODULE_DATA['reset_sequence']==='D'}selected{/if}>
										{\App\Language::translate('LBL_RS_DAY',$QUALIFIED_MODULE)}
									</option>
								</select>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<table id="customRecordNumbering" class="table table-bordered">
						<thead>
						<tr>
							<th width="30%" class="{$WIDTHTYPE}">
								{\App\Language::translate('LBL_USE_CUSTOM_VARIABLES', $QUALIFIED_MODULE)}
							</th>
							<th width="70%" class="{$WIDTHTYPE} border-left-0"></th>
						</tr>
						</thead>
						<tbody>
						<tr>
							<td class="{$WIDTHTYPE}">
								<label class="float-right">
									<b>{\App\Language::translate('LBL_CUSTOM_VARIABLES', $QUALIFIED_MODULE)}</b>
									<a href="#" class="js-popover-tooltip ml-2"
									   data-js="popover"
									   data-trigger="focus hover"
									   data-content="{\App\Language::translate('LBL_CUSTOM_VARIABLES_INFO', $QUALIFIED_MODULE)}">
										<span class="fas fa-info-circle"></span>
									</a>
								</label>
							</td>
							<td class="fieldValue {$WIDTHTYPE} border-left-0">
								<div class="form-inline">
									<div class="input-group w-100">
										<select class="select2 form-control" id="customVariables"
												name="custom_variables">
											<option value="YYYY">{\App\Language::translate('LBL_CV_FULL_YEAR', $QUALIFIED_MODULE)}</option>
											<option value="YY">{\App\Language::translate('LBL_CV_YEAR', $QUALIFIED_MODULE)}</option>
											<option value="MM">{\App\Language::translate('LBL_CV_FULL_MONTH', $QUALIFIED_MODULE)}</option>
											<option value="M">{\App\Language::translate('LBL_CV_MONTH', $QUALIFIED_MODULE)}</option>
											<option value="DD">{\App\Language::translate('LBL_CV_FULL_DAY', $QUALIFIED_MODULE)}</option>
											<option value="D">{\App\Language::translate('LBL_CV_DAY', $QUALIFIED_MODULE)}</option>
										</select>
										<div class="input-group-append">
											<input type="hidden" value="" id="customVariable"/>
											<button class="btn btn-sm btn-info float-right" id="customVariableCopy"
													title="{\App\Language::translate('LBL_COPY_CV', $QUALIFIED_MODULE)}">
												<span class="fas fa-copy"></span> {\App\Language::translate('LBL_COPY_CV', $QUALIFIED_MODULE)}
											</button>
										</div>
									</div>
								</div>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 float-right">
					<div class="float-right">
						<button class="btn btn-success saveButton" type="submit" disabled="disabled">
							<span class="fa fa-check u-mr-5px"></span>{\App\Language::translate('LBL_SAVE', $QUALIFIED_MODULE)}
						</button>
						<button class="cancelLink btn btn-warning" type="reset"
								onclick="javascript:window.history.back();">
							<span class="fa fa-times u-mr-5px"></span>{\App\Language::translate('LBL_CANCEL', $QUALIFIED_MODULE)}
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
{/strip}
