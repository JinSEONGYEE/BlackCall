# Voice Phishing Prevention App (Monorepo)

Real-time fraud detection during phone calls using on-device ML and server-side analysis.

## Project Structure

```text
voice_phishing_root/
├── app/          # Flutter Mobile Application
├── server/       # Nest.js Backend Server
├── docs/         # Shared documentation and specifications
└── GEMINI.md     # Project-specific rules and persistent memory
```

## Getting Started

### Prerequisites
- Flutter SDK (3.10.8 or later)
- Node.js (v18 or later)
- Docker (for database)

### Global Rules
Refer to [GEMINI.md](./GEMINI.md) for project-specific development rules and persistence policies.

## Sub-projects

### [App](./app/README.md)
- **Framework**: Flutter
- **Key Features**: Call detection, Real-time voice analysis, TFLite inference.

### [Server](./server/README.md)
- **Framework**: Nest.js
- **Key Features**: Auth (Kakao), Fraud pattern delivery, Whitelist sync.
- **Database**: PostgreSQL with Prisma ORM.
