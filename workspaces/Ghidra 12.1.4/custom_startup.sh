#!/usr/bin/env bash
set -e

START_COMMAND="/opt/ghidra/ghidraRun"
MAXIMIZE_SCRIPT=$STARTUPDIR/maximize_window.sh

kasm_startup() {
    /usr/bin/filter_ready
    /usr/bin/desktop_ready

    # Optional: wait 1–2 seconds for WM icons/panels to settle
    sleep 1

    # Maximize if supported by Kasm
    bash "${MAXIMIZE_SCRIPT}" &

    # Launch Ghidra
    ${START_COMMAND} &
}

echo "Starting Ghidra workspace startup script..."

# Loop so if Ghidra crashes, user still gets an environment to reopen it
kasm_startup