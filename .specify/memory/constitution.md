<!--
Sync Impact Report:
- Version change: 1.1.0 → 1.2.0
- Modified Principles: None
- Added Sections: Test Directory Structure
- Removed Sections: None
- Templates requiring updates: ✅ plan-template.md, ✅ spec-template.md, ✅ tasks-template.md
- Follow-up TODOs: None
-->

# Flutter CICD Constitution

## Core Principles

### Continuous Integration

All code changes must pass automated tests, analysis, and quality assurance workflows before merging.

### Quality Assurance Automation

QA processes are automated using tools like Roboto and Appium to ensure consistent and reliable testing.

### Multi-Platform Distribution

Applications are distributed to Firebase App Distribution, TestFlight, Play Store, and App Store for various environments.

### Governance and Compliance

All workflows must comply with governance rules, including versioning and deployment policies.

### Observability

Structured logging and monitoring are mandatory to ensure system reliability and debuggability.

### Test Directory Structure

Tests must follow the prescribed directory structure:

```
/tests/
  smoke/           # P0 short tests
  regression/      # P0+P1 tests
/resources/
  locators.resource  # Keywords by ValueKey
/conf/
  staging.yaml
```

## Security and Performance Standards

All builds must adhere to security best practices and meet defined performance benchmarks.

## Development Workflow

Code reviews, testing gates, and deployment approvals are mandatory for all changes.

## Governance

Amendments require documentation, approval, and a migration plan. All PRs must verify compliance with the constitution.

**Version**: 1.2.0 | **Ratified**: 2025-10-01 | **Last Amended**: 2025-10-04
