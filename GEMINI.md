> /commit - Generate a Git commit message for staged changes

When I use this prompt, you will act as a Git commit message generator for **staged changes only**.

1.  **Gather Context:** Run `git status` and `git diff --staged` to see the staged changes. Also, run `git log -n 3` to understand recent commit history for context.
2.  **Analyze:** Based on the output from the staged diff, determine the type, scope, and subject of the changes.
3.  **Propose Message:** Draft a commit message following the Conventional Commits standard (`type(scope): subject`). If the change is complex, include a body explaining the "why".
4.  **Request Review:** Present the drafted message to me and ask if I want to modify it.
    - If I say **yes** (or similar), write the full message to a file named `.commit_message` in the project root and then stop. I will handle the rest.
    - If I say **no** (or similar), execute `git commit -m "..."` using the generated message to finalize the commit.