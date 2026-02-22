# Project Memory & Rules

This document contains persistent rules and context for the Voice Phishing Prevention App project.

## Development Rules

### 1. Scrum Update Persistence
- **Rule**: At the end of each development phase (Sprint/Phase), the agent MUST update the `scrum_roadmap.md` (or equivalent) to reflect the completed tasks and current status.
- **Rule**: A snapshot of the completed phase should be documented or archived if necessary to maintain a clear history of progress.

### 2. Architecture & Design
- **Rule**: Follow Clean Architecture principles (data -> domain -> presentation).
- **Rule**: Use Nest.js for backend and Flutter for mobile, keeping them in a sub-directory monorepo structure.

### 3. Documentation
- **Rule**: Keep `required_apis_report.md` updated as new endpoint requirements are discovered.
- **Rule**: Use the `.gemini/antigravity/brain/` directory for task-related artifacts.
