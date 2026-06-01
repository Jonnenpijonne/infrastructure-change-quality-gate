#!/usr/bin/env python3
"""
Compatibility wrapper for the legacy validator path.
"""

import sys
from pathlib import Path


def _bootstrap_repo_root():
    repo_root = Path(__file__).resolve().parents[2]
    repo_root_str = str(repo_root)
    if repo_root_str not in sys.path:
        sys.path.insert(0, repo_root_str)


def main():
    _bootstrap_repo_root()
    from validation.pre_merge_checks.cli import main as cli_main

    cli_main()


if __name__ == "__main__":
    main()