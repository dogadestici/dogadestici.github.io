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

assert_order() {
  local first_pattern="$1"
  local second_pattern="$2"
  local file="$3"
  local first_line
  local second_line

  first_line="$(rg -n -m 1 --fixed-strings "$first_pattern" "$root_dir/$file" | cut -d: -f1)"
  second_line="$(rg -n -m 1 --fixed-strings "$second_pattern" "$root_dir/$file" | cut -d: -f1)"
  if [[ -z "$first_line" || -z "$second_line" || "$first_line" -ge "$second_line" ]]; then
    printf 'Expected %s before %s in %s\n' "$first_pattern" "$second_pattern" "$file" >&2
    exit 1
  fi
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
  assert_count 2 'class="academic-accordion"' "$file"
  assert_contains 'academic-accordion__summary' "$file"
  assert_contains 'id="penrose-singularities"' "$file"
  assert_contains 'id="alpoge-jacobian"' "$file"
  assert_count 2 'class="academic-accordion__date"' "$file"
  assert_contains 'datetime="2026-08-08"' "$file"
  assert_contains 'datetime="2026-08-01"' "$file"
  assert_contains '08.08.2026' "$file"
  assert_contains '01.08.2026' "$file"
  assert_contains 'id="penrose-ref10"' "$file"
  assert_order 'id="penrose-singularities"' 'id="alpoge-jacobian"' "$file"
  assert_contains 'window.MathJax' "$file"
  assert_contains 'inlineMath' "$file"
  assert_contains 'src="https://cdn.jsdelivr.net/npm/mathjax@4/tex-chtml.js"' "$file"
  assert_order 'window.MathJax' 'src="https://cdn.jsdelivr.net/npm/mathjax@4/tex-chtml.js"' "$file"
done

assert_contains 'İyi ki Doğdun Sir Roger Penrose' blog-akademik.html
assert_contains 'Happy Birthday, Sir Roger Penrose' en/blog-akademik.html

assert_contains '.resource-accordion' css/main.css
assert_contains '.academic-accordion' css/main.css
assert_contains '.academic-accordion__date' css/main.css
assert_contains '.academic-accordion__date' css/media.css

printf 'Academic accordion checks passed.\n'
