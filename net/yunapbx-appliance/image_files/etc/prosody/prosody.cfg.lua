admins = { "admin@localhost" }
interfaces = { "127.0.0.1" }
ssl = { key = "/data/ssl/server.key", certificate = "/data/ssl/server.crt" }

modules_enabled = {

        -- Generally required
                "roster"; -- Allow users to have a roster. Recommended ;)
                "saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
                "tls"; -- Add support for secure TLS on c2s/s2s connections
                "dialback"; -- s2s dialback support
                "disco"; -- Service discovery

        -- Not essential, but recommended
                "private"; -- Private XML storage (for room bookmarks, etc.)
                "vcard"; -- Allow users to set vCards
                --"privacy"; -- Support privacy lists
                --"compression"; -- Stream compression

        -- Nice to have
                "legacyauth"; -- Legacy authentication. Only used by some old clients and bots.
                "version"; -- Replies to server version requests
                "uptime"; -- Report how long server has been running
                "time"; -- Let others know the time here on this server
                "ping"; -- Replies to XMPP pings with pongs
                "pep"; -- Enables users to publish their mood, activity, playing music and more
                "register"; -- Allow users to register on this server using a client and change passwords
                "adhoc"; -- Support for "ad-hoc commands" that can be executed with an XMPP client

        -- Admin interfaces
                "admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
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

allow_registration = false;
--c2s_require_encryption = false
--s2s_require_encryption = false
authentication = "internal_plain"
storage = "sql"
sql = { driver = "MySQL", database = "yunapbx", username = "root", password = "", host = "127.0.0.1" }

log = { error = "/var/log/prosody/prosody.err" }

pidfile = "/var/run/prosody/prosody.pid"

consider_bosh_secure = true
http_default_host = "localhost"

-- User and group, used for daemon
prosody_user = "prosody"
prosody_group = "prosody"

VirtualHost "localhost"

Component "conference.localhost" "muc"

-- Set up a SOCKS5 bytestream proxy for server-proxied file transfers:
--Component "proxy.example.com" "proxy65"

---Set up an external component (default component port is 5347)
--
-- External components allow adding various services, such as gateways/
-- transports to other networks like ICQ, MSN and Yahoo. For more info
-- see: http://prosody.im/doc/components#adding_an_external_component
--
--Component "gateway.example.com"
--      component_secret = "password"
