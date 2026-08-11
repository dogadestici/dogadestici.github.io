# Academic Projects Accordion Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Convert the Turkish academic projects page into two compact, date-labeled native accordions with expandable project details.

**Architecture:** Reuse the existing `academic-accordion` CSS and native HTML `details/summary` pattern already used by the academic blog. Keep all project copy, navigation, and the contact box in `academic-projects.html`; extend the existing shell test with precise order and content assertions.

**Tech Stack:** Static HTML, shared CSS, Bash assertions in `test-academic-accordion.sh`.

## Global Constraints

- New project title: `Çıplak Tekillikler Etrafında Saçılma Dinamiği`.
- New project date: `2026 AUGUST - CURRENT`.
- Existing Schwarzschild project date: `2025 NOVEMBER`.
- New project is marked `ÇALIŞMA AŞAMASINDA`, done with Sena Yarar, and independent without an academic advisor.
- New accordion must appear before the existing Schwarzschild accordion.
- Reuse existing `academic-accordion` styles; do not add JavaScript or change navigation.

---

### Task 1: Add failing academic-projects assertions

**Files:**
- Modify: `test-academic-accordion.sh` in the existing accordion assertion section.
- Test: `academic-projects.html` through the shell assertions.

**Interfaces:**
- Consumes: the `assert_count`, `assert_contains`, and `assert_order` helpers already defined in the test script.
- Produces: regression checks for two native academic accordions, their dates, titles, collaborator, and order.

- [ ] **Step 1: Add the red assertions**

Add this block before the final CSS assertions:

```bash
assert_count 2 'class="academic-accordion"' academic-projects.html
assert_contains 'id="scattering-dynamics"' academic-projects.html
assert_contains 'id="schwarzschild-penrose"' academic-projects.html
assert_contains 'class="academic-accordion__summary"' academic-projects.html
assert_contains 'class="academic-accordion__date"' academic-projects.html
assert_contains 'datetime="2026-08"' academic-projects.html
assert_contains 'datetime="2025-11"' academic-projects.html
assert_contains '2026 AUGUST - CURRENT' academic-projects.html
assert_contains '2025 NOVEMBER' academic-projects.html
assert_contains 'Çıplak Tekillikler Etrafında Saçılma Dinamiği' academic-projects.html
assert_contains 'Sena Yarar' academic-projects.html
assert_contains 'ÇALIŞMA AŞAMASINDA' academic-projects.html
assert_order 'id="scattering-dynamics"' 'id="schwarzschild-penrose"' academic-projects.html
```

- [ ] **Step 2: Save the test-only change**

Do not modify production HTML in this step. The test must now describe the approved accordion structure.

### Task 2: Verify the red state

**Files:**
- Test: `test-academic-accordion.sh`.

**Interfaces:**
- Consumes: the assertions added in Task 1.
- Produces: a failure caused by the missing accordion markup in `academic-projects.html`.

- [ ] **Step 1: Run the focused test**

Run:

```bash
bash test-academic-accordion.sh
```

Expected: FAIL with a missing `class="academic-accordion"` or equivalent content assertion, because the page still contains the old open research card.

### Task 3: Implement the two accordions

**Files:**
- Modify: `academic-projects.html` in the inline project styles and the project content section.

**Interfaces:**
- Consumes: shared `.academic-accordion`, `.academic-accordion__summary`, `.academic-accordion__title`, `.academic-accordion__date`, and `.academic-accordion__content` styles from `css/main.css`.
- Produces: two native `details/summary` project entries with expandable details and preserved contact content.

- [ ] **Step 1: Replace the open research card with the new accordion markup**

Use this structure for the new first project:

```html
<details id="scattering-dynamics" class="academic-accordion" data-aos="fade-up" data-aos-delay="100" aria-labelledby="scattering-dynamics-title">
  <summary id="scattering-dynamics-title" class="academic-accordion__summary">
    <span class="academic-accordion__title">Çıplak Tekillikler Etrafında Saçılma Dinamiği</span>
    <time class="academic-accordion__date" datetime="2026-08">2026 AUGUST - CURRENT</time>
  </summary>
  <div class="academic-accordion__content text-block">
    <div class="project-status">ÇALIŞMA AŞAMASINDA</div>
    <p>
      Sena Yarar ile birlikte yürüttüğümüz bu çalışma, çıplak tekillikler etrafındaki saçılma dinamiklerini incelemeye odaklanmaktadır.
    </p>
    <p>
      Bu proje herhangi bir akademik danışmana bağlı olmadan, bağımsız olarak yürütülmektedir.
    </p>
  </div>
</details>
```

- [ ] **Step 2: Move the existing Schwarzschild content into the second accordion**

Keep the existing title and paragraphs, wrap them in this summary/content structure, and add the approved date:

```html
<details id="schwarzschild-penrose" class="academic-accordion" data-aos="fade-up" data-aos-delay="150" aria-labelledby="schwarzschild-penrose-title">
  <summary id="schwarzschild-penrose-title" class="academic-accordion__summary">
    <span class="academic-accordion__title">Conformal Compactification and Penrose Diagram of the Schwarzschild Spacetime</span>
    <time class="academic-accordion__date" datetime="2025-11">2025 NOVEMBER</time>
  </summary>
  <div class="academic-accordion__content text-block">
    <div class="project-status">ÇALIŞMA AŞAMASINDA</div>
    <p>
      Çekya'daki Erasmus sürecimde başlattığım bu bağımsız araştırma projesi üzerinde aktif olarak çalışmaya devam etmekteyim. Çalışma kapsamında, Schwarzschild karadelik uzay-zamanının nedensel yapısını diferansiyel geometrik metotlar yardımıyla inceliyor; Lorentzian manifoldlarında konform kompaktlaştırma (conformal compactification) tekniklerini uygulayarak sonsuz uzay-zaman sınırlarını sonlu bir Penrose diyagramı üzerinde haritalandırma üzerine odaklanıyorum.
    </p>
    <p style="margin-top: 15px; font-style: italic;">
      <strong>Durum:</strong> Yakında çalışma notlarım ve proje çıktıları burada paylaşılacaktır.
    </p>
    <p style="font-size: 0.95rem; font-style: italic; margin-top: 20px; border-top: 2px dashed var(--primary-accent); padding-top: 15px;">
      <strong>Not:</strong> Bu çalışma, herhangi bir akademik danışman (advisor) bağlılığı olmaksızın, tamamen bağımsız olarak yürüttüğüm bir araştırma projesidir. Dolayısıyla metodoloji, kaynak veya fikir paylaşımları benim için ekstra değerlidir.
    </p>
  </div>
</details>
```

Remove only obsolete `.research-card`-specific inline rules if they no longer have a consumer; keep `.project-status` and `.collab-links` rules because the details still use them.

### Task 4: Verify the green state

**Files:**
- Test: `test-academic-accordion.sh`.
- Verify: `academic-projects.html`.

**Interfaces:**
- Consumes: the finished native accordion markup and existing shared CSS.
- Produces: passing structural/content regression checks.

- [ ] **Step 1: Run the focused test again**

Run:

```bash
bash test-academic-accordion.sh
```

Expected: PASS with `Academic accordion checks passed.`

- [ ] **Step 2: Check the diff for whitespace errors**

Run:

```bash
git diff --check
```

Expected: no output and exit status 0.

### Task 5: Commit and push the approved change

**Files:**
- Commit: `academic-projects.html`, `test-academic-accordion.sh`.

**Interfaces:**
- Consumes: passing tests and clean diff checks.
- Produces: one intentional commit on the current `main` branch and a successful push to its configured remote.

- [ ] **Step 1: Review the final status and diff**

Run:

```bash
git status --short
git diff -- academic-projects.html test-academic-accordion.sh
```

Expected: only the requested accordion page and its regression assertions are changed beyond the already committed design/plan documents.

- [ ] **Step 2: Create the implementation commit**

Run:

```bash
git add academic-projects.html test-academic-accordion.sh
git commit -m "feat: add academic project accordions"
```

- [ ] **Step 3: Push the current main branch**

Run:

```bash
git push origin main
```

Expected: the remote `main` branch accepts the new implementation commit.
