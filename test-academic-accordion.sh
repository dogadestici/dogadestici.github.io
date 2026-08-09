#!/usr/bin/env bash
set -euo pipefail

root_dir="$(cd "$(dirname "$0")" && pwd)"

assert_count() {
  local expected="$1"
  local pattern="$2"
  local file="$3"
  local actual

  actual="$(rg -o "$pattern" "$root_dir/$file" 2>/dev/null || true)"
  actual="$(printf '%s\n' "$actual" | sed '/^$/d' | wc -l | tr -d ' ')"
  if [[ "$actual" != "$expected" ]]; then
    printf 'Expected %s matches for %s in %s, got %s\n' "$expected" "$pattern" "$file" "$actual" >&2
    exit 1
  fi
}

assert_contains() {
  local pattern="$1"
  local file="$2"
  rg -q --fixed-strings "$pattern" "$root_dir/$file" || {
    printf 'Missing %s in %s\n' "$pattern" "$file" >&2
    exit 1
  }
}

for file in academic-tools.html en/academic-tools.html; do
  assert_count 5 'class="resource-accordion"' "$file"
  assert_contains 'resource-accordion__summary' "$file"
  assert_contains 'https://www.overleaf.com/' "$file"
  assert_contains 'https://www.litmaps.com/' "$file"
  assert_contains 'https://www.bibguru.com/' "$file"
done

assert_contains 'arXiv - Subscription' academic-tools.html
assert_contains 'arXiv - Python ile Filtreleme' academic-tools.html
assert_contains 'arXiv - Subscription' en/academic-tools.html
assert_contains 'arXiv - Python Filtering' en/academic-tools.html

for file in blog-akademik.html en/blog-akademik.html; do
  assert_count 1 'class="academic-accordion"' "$file"
  assert_contains 'academic-accordion__summary' "$file"
  assert_contains 'id="alpoge-jacobian"' "$file"
done

assert_contains '.resource-accordion' css/main.css
assert_contains '.academic-accordion' css/main.css

printf 'Academic accordion checks passed.\n'
