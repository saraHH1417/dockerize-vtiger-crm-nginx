<?php
#for Sync Service Check Pull Updated Method
$pullUpdatesTime = 900; // in seconds
#for Sync Service Check Pull Method
// Workaround - Sync could have failed in last poll
// Since deduplication is already handled in their side
// we are backdating accesstime to send those records
// possible sent earlier as well.
$pullTime = 14400; // in seconds
//standard zapier integration
$zapierIntegration = false;