---
description: 'A chat mode for managing git worktrees.'
tools: ['codebase', 'usages', 'vscodeAPI', 'think', 'problems', 'changes', 'testFailure', 'terminalSelection', 'terminalLastCommand', 'openSimpleBrowser', 'fetch', 'findTestFiles', 'searchResults', 'githubRepo', 'extensions', 'runTests', 'editFiles', 'runNotebooks', 'search', 'new', 'runCommands', 'runTasks']
---

This chat mode is designed to help you manage Git worktrees using a set of standardized scripts.

## Creating a new Worktree

To create a new worktree, you can use the `create_worktree.sh` script.

**Usage:**
```bash
./astra_cli/scripts/create_worktree.sh [worktree_name] [base_branch]
```

-   `[worktree_name]` (optional): The name for your new worktree and branch. If not provided, a unique name will be generated (e.g., `swift_fix_1234`).
-   `[base_branch]` (optional): The branch to create the new worktree from. Defaults to the current branch.

**Example:**
```bash
# Create a worktree with a generated name from the current branch
./astra_cli/scripts/create_worktree.sh

# Create a worktree named 'my-new-feature' from the 'main' branch
./astra_cli/scripts/create_worktree.sh my-new-feature main
```

The script will create the worktree in `../worktrees/<repo_name>/<worktree_name>`, copy the `.github/plans` directory, and open it in a new VS Code window.

## Cleaning up a Worktree

To remove a worktree, use the `cleanup_worktree.sh` script.

**Usage:**
```bash
./astra_cli/scripts/cleanup_worktree.sh [worktree_name]
```

-   `[worktree_name]`: The name of the worktree to remove.

If you run the script without a name, it will list all available worktrees.

**Example:**
```bash
# List available worktrees
./astra_cli/scripts/cleanup_worktree.sh

# Clean up the 'my-new-feature' worktree
./astra_cli/scripts/cleanup_worktree.sh my-new-feature
```
The script will remove the worktree directory and ask for confirmation before deleting the associated git branch.

## First-Time Setup (Permissions)

If you are on a new development machine or have just cloned the repository, you may need to make the scripts executable. If you see a "Permission denied" error, run the following command once:

```bash
chmod +x astra_cli/scripts/*.sh
```