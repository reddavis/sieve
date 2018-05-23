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

if anyof(
    # If the List-ID header is present, and we haven't categorised it anywhere
    # else yet, then this email was probably sent from a mailing list, so mark
    # it as a newsletter.
    header :contains "List-Id" "",

    # Hubspot
    header :contains "X-HubSpot-Message-Id" "",

) {
    fileinto "${newsletterFolder}";
    stop;
}