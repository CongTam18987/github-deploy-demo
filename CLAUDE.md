# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a minimal static demo site used to illustrate the GitHub Pages deployment workflow. There is no build system, package manager, or test suite — the entire app is a single `index.html` file.

## Architecture

- `index.html` — the entire application: inline `<style>` for a centered card UI and inline `onclick` JavaScript for a click counter. There are no separate JS/CSS files or external dependencies.
- `README.md` (Vietnamese) — documents the deploy flow: push to `main` → GitHub Pages builds and hosts the site at `https://<username>.github.io/<repo-name>/`.

## Development

- To preview locally, open `index.html` directly in a browser — no server or build step required.
- Deployment is automatic via GitHub Pages on push to `main`; there is no CI/build pipeline to invoke manually.
