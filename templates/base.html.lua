-- vim: set ft=html:
return function(context)
    return string.gsub([[
<!doctype html>
<html>
<head>
    <title>vocontrol</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="$URL/css/bootstrap.min.css" />
    <link rel="stylesheet" href="$URL/css/darkstrap.css" />
    <link rel="stylesheet" href="$URL/css/bootstrap-responsive.css" />
    <link rel="stylesheet" href="$URL/css/style.css" />
    <link rel="stylesheet" href="$URL/css/jquery-ui-1.10.0.custom.min.css" />
    <script src="$URL/js/jquery-1.9.1.min.js"></script>
    <script src="$URL/js/underscore.min.js"></script>
    <!--<script src="http://code.jquery.com/ui/1.10.0/jquery-ui.js"></script>-->
    <script src="$URL/js/bootstrap.min.js"></script>
    <script src="$URL/js/jquery.strings.js"></script>
    <script src="$URL/js/jquery.jsonrpc.js"></script>
    <script src="$URL/js/jquery.inputHistory.min.js"></script>
    <script src="$URL/js/jquery-ui-1.10.0.custom.min.js"></script>
    <script src="$URL/js/vocontrol.js"></script>
    <script>
        interval = $INTERVAL;
    </script>
</head>
<body data-spy="scroll" data-target=".navbar">
    <div class="navbar navbar-fixed-top">
        <div class="navbar-inner">
            <div class="container">
                <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </a>
                <a class="brand" href="#top">vocontrol</a>
                <div class="nav-collapse collapse">
                    <ul class="nav" id="nav-events">
                        <li><a href="#anchor-chat" id="nav-event-chat" class="nav-event-item">Chat</a></li>
                        <li><a href="#anchor-sector" id="nav-event-sector" class="nav-event-item">Sector</a></li>
                    </ul>
                    <ul class="nav pull-right">
                        <li><a><span id="player-name" style="display:inline"></span></a></li>
                        <li class="divider-vertical"></li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Tools <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="#" id="vo-reload">Reload Interface</a></li>
                                <li><a href="#" id="vo-update">Update Now</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

    <a id="anchor-top"></a>

    <div class="container well" id="content">

        <a id="anchor-chat"></a>
        <div id="tab-chat" class="tabs">


            <div id="chat-box" class="well"></div>
            <form id="chat-form" class="well">
                <fieldset>
                    <div class="input-append input-prepend">
                        <div class="btn-group dropup" id="channel-dropup">
                            <button id="channel-current" class="btn dropdown-toggle btn-inverse" data-toggle="dropdown">
                                Channel
                            </button>

                            <input class="input-xxlarge" id="chat-msg" type="text" autocomplete=off \>

                            <ul class="dropdown-menu" id="channel-options">
                                <li><a href="#">Sector</a></li>
                                <li class="active"><a href="#">Channel</a></li>
                                <li><a href="#">Group</a></li>
                                <li><a href="#">Guild</a></li>
                                <li><a href="#">System</a></li>
                            </ul>
                        </div>
                        <button class="btn btn-primary" type="submit">Send</button>
                    </div>
                </fieldset>
            </form>
        </div>

        <div id="tab-sector" class="tabs">

            <a id="anchor-sector"></a>

            <div id="sector-table-container">
                <table id="sector-table" class="table table-striped">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Distance</th>
                            <th>Ship</th>
                            <th>Health</th>
                            <th>Faction</th>
                        </tr>
                    </thead>
                    </tbody>
                </table>
            </div>
       </div>
    </div>
</body>
</html>
]], "%$(%w+)", function(k) return context[k] end)
end
