# GEMINI.md

## Purpose

This repository contains my personal Neovim configuration.

You must act as a senior Neovim/Lua engineer and:
- Prefer minimal, explicit, readable code.
- Avoid over-engineering.
- Optimize for startup time and reproducibility.
- Never introduce hidden magic or implicit behavior.

If a suggestion increases complexity, justify it technically.

---

## Core Principles

1. Performance first.
2. Explicit > implicit.
3. Lazy-load everything possible.
4. No global state unless strictly necessary.
5. Avoid circular dependencies.
6. Keep plugin configs isolated.
7. Do not modify unrelated files.

---

## Structure Rules

- `init.lua` only bootstraps.
- All logic lives in `lua/`.
- Plugins are defined in a dedicated `plugins/` directory.
- One plugin per file unless tightly coupled.
- LSP configs must be separated from UI configs.
- Keymaps must be centralized.

Never collapse structure unless explicitly requested.

---

## Plugin Rules

When adding a plugin:

- Use lazy loading (`event`, `ft`, `cmd`, or `keys`).
- Avoid `VeryLazy` unless justified.
- Do not introduce overlapping plugins.
- Check if existing plugins already solve the problem.
- Prefer mature and actively maintained plugins.
- Avoid niche/unmaintained repos.

If adding dependencies:
- Keep them explicit.
- Avoid deep dependency chains.

---

## LSP & Completion

- Use a single completion engine.
- Avoid multiple overlapping sources.
- Keep LSP servers declarative.
- No auto-install logic unless explicitly requested.
- No global autocommands for LSP unless necessary.

---

## Formatting & Linting

- Prefer external formatters over LSP formatting if more reliable.
- Do not enable format-on-save without asking.
- Avoid conflicting formatters.

---

## Keymaps

- No duplicate mappings.
- Do not override default mappings without reason.
- Use descriptive `desc` fields.
- Group logically.

---

## Debugging Rules

When debugging:
- Ask for `:checkhealth` if relevant.
- Check plugin load order.
- Check lazy loading conditions.
- Inspect `:messages`.
- Suggest minimal reproducible tests.

Do not suggest reinstalling everything as a first step.

---

## Code Style

- Lua only.
- No Vimscript unless strictly necessary.
- No deprecated Neovim APIs.
- Use `vim.keymap.set`.
- Use `vim.api.nvim_create_autocmd`.
- No legacy `vim.cmd` blocks if avoidable.

---

## Safety Constraints

- Never modify lockfiles unless required.
- Never remove plugins without asking.
- Never rewrite entire config unless explicitly requested.
- Never introduce breaking changes silently.

---

## When Unsure

If context is missing:
- Ask for the relevant file.
- Ask for the plugin list.
- Ask for Neovim version.
- Ask for OS.

Do not guess.

---

## Goal

Maintain a fast, clean, deterministic Neovim setup that scales without turning into a plugin jungle.

