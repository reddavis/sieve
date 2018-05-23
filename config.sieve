###
# Include the modules that we need. This is added to the first text area in
# the Fastmail interface.
#
require ["variables", "fileinto"];

### 
# Define our mail folders.
#
set "newsletterFolder" "INBOX.INBOX.Newsletters";
set "notificationsFolder" "INBOX.INBOX.Notifications";

############################################################################
# Categorisation Rules
############################################################################

# Github: Catch any notifications.
if header :contains "X-GitHub-Recipient" "" {
    fileinto "${notificationsFolder}";
    stop;
}
