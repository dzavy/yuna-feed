admins = { "admin@localhost" }
interfaces = { "127.0.0.1" }

modules_enabled = {

        -- Generally required
                "roster"; -- Allow users to have a roster. Recommended ;)
                "saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
                --"tls"; -- Add support for secure TLS on c2s/s2s connections
                "dialback"; -- s2s dialback support
                "disco"; -- Service discovery

        -- Not essential, but recommended
                "private"; -- Private XML storage (for room bookmarks, etc.)
                "vcard"; -- Allow users to set vCards
                --"privacy"; -- Support privacy lists
                --"compression"; -- Stream compression

        -- Nice to have
                --"legacyauth"; -- Legacy authentication. Only used by some old clients and bots.
                "version"; -- Replies to server version requests
                "uptime"; -- Report how long server has been running
                "time"; -- Let others know the time here on this server
                "ping"; -- Replies to XMPP pings with pongs
                "pep"; -- Enables users to publish their mood, activity, playing music and more
                --"register"; -- Allow users to register on this server using a client and change passwords
                "adhoc"; -- Support for "ad-hoc commands" that can be executed with an XMPP client

        -- Admin interfaces
                --"admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
                "admin_telnet"; -- Opens telnet console interface on localhost port 5582

        -- Other specific functionality
                "posix"; -- POSIX functionality, sends server to background, enables syslog, etc.
                "bosh"; -- Enable BOSH clients, aka "Jabber over HTTP"
                --"httpserver"; -- Serve static files from a directory over HTTP
                "groups"; -- Shared roster support
                --"announce"; -- Send announcement to all online users
                --"welcome"; -- Welcome users who register accounts
                --"watchregistrations"; -- Alert admins of registrations
                --"motd"; -- Send a message to users when they log in
};

modules_disabled = {
                "mod_s2s";
                "mod_c2s";
};

allow_registration = false;
authentication = "internal_plain"
storage = "sql"
sql = { driver = "MySQL", database = "yunapbx", username = "root", password = "", host = "127.0.0.1" }

log = { error = "*syslog" }
pidfile = "/var/run/prosody.pid"
prosody_user = "prosody"
prosody_group = "prosody"

consider_bosh_secure = true
http_default_host = "localhost"

VirtualHost "localhost"

Component "conference.localhost" "muc"

Component "asterisk.localhost"
      component_secret = "asterisk"
