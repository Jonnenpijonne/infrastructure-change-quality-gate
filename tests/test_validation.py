import subprocess
import sys
import unittest
from pathlib import Path


REPO_ROOT = Path(__file__).resolve().parents[1]
VALIDATOR = REPO_ROOT / "validation" / "pre-merge-checks" / "validate-change-request.py"


class ValidationParityTests(unittest.TestCase):
    def run_validator(self, target_file):
        return subprocess.run(
            [sys.executable, str(VALIDATOR), str(target_file)],
            capture_output=True,
            text=True,
            cwd=REPO_ROOT,
            check=False,
        )

    def test_valid_change_request(self):
        valid_file = REPO_ROOT / "examples" / "example-change-request.md"
        result = self.run_validator(valid_file)
        self.assertEqual(result.returncode, 0)
        self.assertIn("QUALITY GATE: PASSED", result.stdout)

    def test_invalid_change_request(self):
        invalid_file = REPO_ROOT / "templates" / "change-request-template.md"
        result = self.run_validator(invalid_file)
        self.assertEqual(result.returncode, 1)
        self.assertIn("QUALITY GATE: FAILED", result.stdout)


if __name__ == "__main__":
    unittest.main()
