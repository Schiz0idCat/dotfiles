require('vim._core.ui2').enable({
    enable = true,
    msg = {
        targets = {
            [''] = 'msg',         -- Default fallback for any message event not explicitly defined
            empty = 'cmd',        -- Handles clearing the command line or showing empty status
            bufwrite = 'msg',     -- Notifications when a buffer is written to disk (:w)
            confirm = 'cmd',      -- Interactive confirmation prompts (e.g., "Save changes? y/n")
            emsg = 'pager',       -- Standard error messages (usually displayed in red)
            echo = 'msg',         -- Output from the basic :echo command
            echomsg = 'msg',      -- Messages from :echomsg (which are also saved in :messages)
            echoerr = 'pager',    -- Error messages generated specifically via :echoerr
            completion = 'cmd',   -- The popup menu for command-line completion (wildmenu)
            list_cmd = 'pager',   -- Output from commands that list info (e.g., :ls, :clist, :map)
            lua_error = 'pager',  -- Runtime errors and stack traces from Lua code execution
            lua_print = 'msg',    -- Output from the Lua print() function
            progress = 'pager',   -- Long-running task progress indicators (e.g., LSP indexing)
            rpc_error = 'pager',  -- Errors originating from external RPC clients or plugins
            quickfix = 'msg',     -- Status updates related to the Quickfix or Location lists
            search_cmd = 'cmd',   -- The command-line used for searching (triggered by / or ?)
            search_count = 'cmd', -- The counter showing search matches (e.g., [1/20])
            shell_cmd = 'pager',  -- Displays the actual command string sent to the system shell
            shell_err = 'pager',  -- Error output (stderr) returned from a shell command
            shell_out = 'pager',  -- Standard output (stdout) returned from a shell command
            shell_ret = 'msg',    -- Notification of the shell command's exit/return code
            undo = 'msg',         -- Status messages after undo/redo operations
            verbose = 'pager',    -- Detailed debug information when 'verbose' is set > 0
            wildlist = 'cmd',     -- The list of candidates shown during command-line completion
            wmsg = 'msg',         -- General system warning messages
            typed_cmd = 'cmd',    -- The text as you are currently typing it after the ':' prompt
        },
        cmd = {                   -- Options related to messages in the cmdline window.
            height = 0.5          -- Maximum height while expanded for messages beyond 'cmdheight'.
        },
        dialog = {                -- Options related to dialog window.
            height = 0.5,         -- Maximum height.
        },
        msg = {                   -- Options related to msg window.
            height = 0.5,         -- Maximum height.
            timeout = 4000,       -- Time a message is visible in the message window.
        },
        pager = {                 -- Options related to message window.
            height = 1,           -- Maximum height.
        },
    },
})
