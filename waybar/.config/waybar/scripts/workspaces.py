#!/usr/bin/env python3
import json
import subprocess
import time
import sys
import os

def get_workspaces():
    """Get workspaces from niri using JSON API"""
    # try:
    result = subprocess.run(
        ["niri", "msg", "workspaces"],
        capture_output=True,
        text=True,
        check=True
    )
    print(result)
    # except (subprocess.CalledProcessError, json.JSONDecodeError) as e:
    #     print(f"Error getting workspaces: {e}", file=sys.stderr)
    #     return []

def create_widget(workspace):
    """Create a widget dictionary for a workspace"""
    # Map numbers to icons (1-10)
    icons = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    # Get icon for workspace number
    ws_num = workspace.get("name", 1)
    icon = icons[ws_num - 1] if 1 <= ws_num <= 10 else str(ws_num)
    
    # Build CSS classes
    classes = []
    if workspace.get("focused", False):
        classes.append("focused")
    if workspace.get("last_focused", False):
        classes.append("last-focused")
    if workspace.get("num_windows", 0) > 0:
        classes.append("occupied")
    
    # Return widget data
    return {
        "name": f"workspace-{ws_num}",
        "text": icon,
        "class": " ".join(classes),
        "tooltip": f"Workspace {ws_num}\nWindows: {workspace.get('num_windows', 0)}"
    }

def main():
    """Main loop - outputs JSON for Waybar"""
    while True:
        workspaces = get_workspaces()
        
        if not workspaces:
            # Output empty if no workspaces
            output = {
                "text": "No workspaces",
                "tooltip": "",
                "class": "error"
            }
            print(json.dumps(output))
            sys.stdout.flush()
        else:
            # Create widgets for each workspace
            widgets = [create_widget(ws) for ws in workspaces]
            
            # Create the full output
            output = {
                "text": "",  # Waybar will use the widget text
                "tooltip": "\n".join([w["tooltip"] for w in widgets]),
                "class": "",
                "workspaces": widgets
            }
            
            print(json.dumps(output))
            sys.stdout.flush()
        
        # Wait before next update
        time.sleep(0.5)

if __name__ == "__main__":
    main()
