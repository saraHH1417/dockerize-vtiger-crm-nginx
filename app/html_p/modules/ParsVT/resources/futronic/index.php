<?php
if ( ! isset( $_REQUEST['module'], $_REQUEST['view'], $_REQUEST['field'], $_REQUEST['language'] ) ) {
	echo "<script>setTimeout(function() {
      window.close();
    },1000)</script>";
}
chdir( "../../../../" );
if ( isset($_REQUEST['language']) && file_exists( "languages/" . $_REQUEST['language'] . "/ParsVT.php" ) ) {
	include_once "languages/" . $_REQUEST['language'] . "/ParsVT.php";
} else {
	include_once "languages/en_us/ParsVT.php";
}
?>
<html>
<head>
    <meta charset="UTF-8">
    <style>
<?php
        if($_REQUEST['language'] == 'fa_ir'){
?>
        * {
            font-family: Tahoma, "Trebuchet MS", "Lucida Grande", Verdana;
            font-size: 12px;
        }

        body {
            direction: rtl;
        }

        <?php }?>
    </style>
</head>
<body>
<div style="text-align: center;">
    <p>
        <canvas id="fingerframe" height="240" width="160"></canvas>
    </p>
    <form name="scanform" id="scanform" method="POST" action="#">
        <input name="fptemplate" id="fptemplate" type="hidden" value="">
        <input name="verifyname" type="hidden" value="test">
        <input name="enroll_2finger" type="hidden" value="0">
        <input type="button" value="" id="btnCancel" onclick="cancelOperation();">
        <input type="button" value="" id="btnRefresh" onclick="refreshOperation();">
        <input type="button" value="" id="btnSave" onclick="saveImgField('<?= $_GET['field'] ?>');">
        <br>
    </form>
    <p id="result" style="color: red;"></p>
</div>
<script>
    var translate_language = <?php echo json_encode( $jsLanguageStrings ); ?>;
    var app = {
        vtranslate: function (key) {
            //convert arguments in to proper array
            var params = [].slice.apply(arguments);
            params.shift();

            function __sprintf(translatedString, params) {
                if (params.length > 0) {
                    var replaceRegex = new RegExp('(%s)', 'g');
                    var paramsPointer = 0;
                    translatedString = translatedString.replace(replaceRegex, function () {
                        var string = params[paramsPointer];
                        paramsPointer++;
                        return string;
                    });
                }
                return translatedString;
            }

            var translatedString = key;
            if (translate_language[key] !== undefined) {
                translatedString = translate_language[key];
            }

            if (translatedString !== null) {
                return __sprintf(translatedString, params);
            }

            return key;
        },
    };
</script>
<script type='text/javascript' src='resources/ftrsdkweb.js?<?php echo rand(1000,9999); ?>'></script>
</html>