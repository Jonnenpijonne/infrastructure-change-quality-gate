# RBAC-Lite Integration

RBAC-Lite is a WordPress-based multi-tenant access control plugin focused on partner-based data isolation, NDA enforcement and audit logging.

This validator can be used as a governance and quality gate for RBAC-Lite access control, tenant isolation and compliance-related changes.

## Relationship

- RBAC-Lite = application/control implementation
- Gatehouse Policy Engine = change validation and governance layer

The validator does not replace RBAC-Lite. It validates whether RBAC-Lite-related changes have sufficient risk classification, approval, rollback planning, test evidence and auditability before merge or deployment.

## Related repositories

- Gatehouse Policy Engine: https://github.com/Jonnenpijonne/infrastructure-change-quality-gate
- RBAC-Lite: https://github.com/Jonnenpijonne/RBAC-Lite

## Recommended risk classification

| RBAC-Lite change type | Suggested risk class | Reason |
|---|---:|---|
| Documentation-only update | 1 | Low operational impact |
| Partner assignment UI or metadata change | 2 | Can affect access management |
| NDA / terms enforcement change | 2 | Can affect compliance evidence |
| Audit logging behavior change | 2 | Can affect traceability |
| Partner isolation query/filter change | 3 | Can expose cross-tenant data |
| Admin bypass / capability logic change | 3 | Can affect privileged access boundaries |
| Database migration touching user meta or audit logs | 3 | Can affect access control and evidence integrity |

## Required evidence

RBAC-Lite-related Class 2 and Class 3 changes should include:

- Description of affected access-control logic
- Test plan with admin and non-admin users
- Rollback plan
- Audit log verification
- Evidence that Partner A cannot see Partner B data
- Evidence that Partner B cannot see Partner A data
- Approval according to the selected risk class

## Example validation command

```bash
python validation/pre-merge-checks/validate-change-request.py examples/rbac-lite-partner-access-change.md


```
