#!/bin/sh
set -eu

repo_dir=${1:?repository path required}

assert_contains() {
  file=$1
  pattern=$2
  if ! rg -q --fixed-strings "$pattern" "$repo_dir/$file"; then
    echo "FAIL: $file does not contain $pattern" >&2
    exit 1
  fi
}

assert_not_contains() {
  file=$1
  pattern=$2
  if rg -q --fixed-strings "$pattern" "$repo_dir/$file"; then
    echo "FAIL: $file still contains $pattern" >&2
    exit 1
  fi
}

assert_file() {
  if [ ! -f "$repo_dir/$1" ]; then
    echo "FAIL: missing file $1" >&2
    exit 1
  fi
}

for file in akademik.html en/akademik.html; do
  assert_contains "$file" 'href="blog-akademik.html"'
  assert_contains "$file" 'grid-template-columns: repeat(2, minmax(0, 1fr));'
  assert_not_contains "$file" 'href="#akademik-blog"'
  assert_not_contains "$file" 'data-aos='
done

for file in sosyal.html en/sosyal.html; do
  assert_contains "$file" 'href="topluluklar.html"'
  assert_contains "$file" 'href="gezi.html"'
  assert_contains "$file" 'href="blog-sosyal.html"'
  assert_contains "$file" 'grid-template-columns: repeat(2, minmax(0, 1fr));'
  assert_not_contains "$file" 'href="#topluluklarim"'
  assert_not_contains "$file" 'href="#gezi"'
  assert_not_contains "$file" 'href="#sosyal-blog"'
  assert_not_contains "$file" 'data-aos='
done

for file in topluluklar.html en/topluluklar.html; do
  assert_file "$file"
  for section in topluluklarim ankarock unirock esn spotify; do
    assert_contains "$file" "id=\"$section\""
  done
done

assert_contains blog-akademik.html 'href="akademik.html"'
assert_contains blog-sosyal.html 'href="sosyal.html"'
assert_contains blog.html 'href="blog-sosyal.html"'
assert_contains blog.html 'href="blog-akademik.html"'
assert_contains en/blog.html 'href="blog-sosyal.html"'
assert_contains en/blog.html 'href="blog-akademik.html"'
assert_contains topluluklar.html 'href="sosyal.html"'
assert_contains gezi.html 'href="sosyal.html"'

echo "PASS: card page routing and content placement checks"
