# Security Policy

## Scope

This policy applies to the source code, GitHub Actions workflows, validation logic, templates and committed example/evidence material in this repository.

Gatehouse is a portfolio/reference implementation rather than a hosted production service. The primary security goal is therefore to keep the repository safe to inspect, clone and adapt without introducing credentials, sensitive operational data or misleading assurance claims.

## Supported version

Security fixes are applied to the current `main` branch. Legacy/demo branches should not be treated as supported security baselines unless their documentation explicitly states otherwise.

## Reporting a vulnerability

Please do not publish suspected secrets, exploitable workflow behaviour or sensitive proof-of-concept details in a public issue.

Use GitHub private vulnerability reporting if it is available for this repository. If private reporting is not available, contact the repository owner privately through GitHub before disclosing details publicly.

A useful report should include:

- affected file, workflow or component;
- the security impact;
- minimal reproduction steps;
- whether the issue can expose credentials, bypass validation or alter audit evidence; and
- any safe remediation suggestion you have.

## Secrets and sensitive data

This repository must not contain:

- production API keys or tokens;
- passwords;
- private keys or certificates with private material;
- customer or employee personal data;
- production infrastructure inventories;
- real access-control assignments; or
- confidential change/audit evidence.

Examples and test fixtures should use synthetic data.

If a secret is committed accidentally, removing it in a later commit is not sufficient. The credential must be considered exposed, revoked or rotated as appropriate, and the repository history should be reviewed for remaining copies.

## GitHub Actions security

Workflow changes are security-sensitive because CI is part of the validation boundary.

When modifying workflows:

- request only the GitHub token permissions the job actually needs;
- avoid exposing secrets to untrusted pull-request code;
- prefer pinned or well-maintained third-party actions;
- treat workflow artifacts and summaries as potentially sensitive outputs;
- do not execute repository-provided shell input without validation; and
- review changes to validation or evidence workflows at least as carefully as application code.

A passing GitHub Actions run proves that configured checks executed successfully. It does not prove that a change is safe, authorized or compliant in a broader organizational sense.

## Validator security assumptions

Change-request documents are untrusted input.

The validator should:

- fail safely on malformed or missing mandatory input;
- avoid shell-command construction from untrusted fields;
- avoid network access unless explicitly required and documented;
- avoid writing outside expected report/output locations;
- produce deterministic results for the same policy and input where practical; and
- separate validation results from claims about the truth of author-provided statements.

The validator can check that a rollback plan exists. It cannot prove that the rollback plan will work. Human technical review remains necessary.

## Evidence integrity

Audit evidence is useful only when its provenance and limitations are clear.

Generated evidence should record enough context to identify:

- the change/input being evaluated;
- the validator/policy version or commit;
- the validation result;
- the execution time where relevant; and
- the checks that passed or failed.

Evidence should be minimized so that logs and artifacts do not become a secondary store of sensitive data.

Committed `evidence/` examples must be curated and synthetic. Runtime-generated reports should remain generated artifacts rather than source unless there is a specific reason to preserve a sanitized example.

## Dependency and supply-chain considerations

This repository should keep dependencies small and reviewable.

For dependency or action updates:

- review upstream ownership and maintenance state;
- prefer explicit versions over floating references where practical;
- review release notes for security-impacting changes;
- avoid adding a dependency when the standard library or existing tooling is sufficient; and
- remove dependencies that are no longer required.

## Deployment boundary

Gatehouse is intentionally not a privileged production deployment broker.

Normal policy validation should not require production credentials. If a future implementation adds deployment capabilities, production APIs or privileged identities, that change materially alters the threat model and requires a new architecture/security review.

## Compliance statement

The project demonstrates **ISO 27001-aligned change-control and audit-evidence concepts**. It is not certified and does not make an adopting organization compliant by itself.

Security and control mappings must be validated against the organization's own policies, risk assessment, applicable ISO 27001 edition, statement of applicability and operational environment.

## Security checklist for changes

Before merging a material change, reviewers should consider:

- [ ] Does this change introduce or broaden credential access?
- [ ] Does it change GitHub Actions permissions or trust boundaries?
- [ ] Can untrusted input reach a shell, filesystem path or external service unsafely?
- [ ] Can the change weaken or bypass a validation gate?
- [ ] Can generated evidence expose sensitive data?
- [ ] Does the change alter risk classification or approval requirements?
- [ ] Is rollback/recovery behaviour still clear?
- [ ] Are new dependencies justified and reviewable?
- [ ] Are documentation and security assumptions updated with the implementation?
