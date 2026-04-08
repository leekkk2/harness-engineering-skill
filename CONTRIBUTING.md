# Contributing

Thank you for your interest in contributing to Harness Engineering Skill!

## How to Contribute

### Reporting Issues

- Use GitHub Issues to report bugs or suggest improvements
- Include your agent platform (Claude Code, Codex, Cursor, etc.)
- Describe the project type where you applied the skill

### Adding Templates

Templates should be:
- **Project-agnostic** — work with any tech stack
- **Self-documenting** — include usage comments at the top
- **Executable** — shell scripts should work on macOS and Linux

### Adding Examples

Case studies should include:
- Project profile (anonymized if needed)
- Before/after state
- Key lessons learned
- Implementation timeline

### Improving SKILL.md

The core skill definition should remain:
- **Self-contained** — an agent reading only SKILL.md should be able to execute
- **Bilingual** — Chinese primary with English technical terms
- **Incremental** — phases can be executed independently

## Development

```bash
# Clone
git clone https://github.com/<owner>/harness-engineering-skill.git

# Test scaffold template
bash templates/scaffold.sh /tmp/test-project
ls -la /tmp/test-project/.harness/

# Test drift detection
bash templates/check-layers.sh /path/to/your/src
```

## License

By contributing, you agree that your contributions will be licensed under the MIT License.
