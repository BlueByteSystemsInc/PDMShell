---
uid: index
title: PDMShell for SOLIDWORKS PDM Automation
description: Automate SOLIDWORKS PDM with PDMShell commands, scripts, the PDMShell add-in, visual workflows, and batch migration tools.
keywords: PDMShell, SOLIDWORKS PDM automation, PDM command line, PDM scripts, SOLIDWORKS PDM add-in, visual script editor
---

<style>
  .pdmshell-home {
    --pdmshell-accent: #2563eb;
    --pdmshell-accent-strong: #1d4ed8;
    --pdmshell-success: #15803d;
    --pdmshell-panel: var(--bs-tertiary-bg);
    --pdmshell-border: var(--bs-border-color);
    --pdmshell-muted: var(--bs-secondary-color);
    color: var(--bs-body-color);
  }

  [data-bs-theme="dark"] .pdmshell-home {
    --pdmshell-accent: #60a5fa;
    --pdmshell-accent-strong: #93c5fd;
    --pdmshell-success: #4ade80;
  }

  .pdmshell-home a {
    color: var(--pdmshell-accent);
  }

  .pdmshell-hero {
    display: grid;
    grid-template-columns: minmax(260px, .78fr) minmax(460px, 1.22fr);
    gap: 24px;
    align-items: center;
    margin: 8px 0 34px;
  }

  .pdmshell-kicker {
    color: var(--pdmshell-accent);
    font-size: 13px;
    font-weight: 700;
    letter-spacing: .08em;
    margin-bottom: 12px;
    text-transform: uppercase;
  }

  .pdmshell-title {
    color: var(--bs-heading-color);
    font-size: clamp(32px, 4.2vw, 50px);
    line-height: 1.08;
    margin: 0 0 18px;
  }

  .pdmshell-lede {
    color: var(--pdmshell-muted);
    font-size: 17px;
    line-height: 1.56;
    margin: 0;
    max-width: 640px;
  }

  .pdmshell-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-top: 24px;
  }

  .pdmshell-button {
    align-items: center;
    border: 1px solid var(--pdmshell-border);
    border-radius: 8px;
    display: inline-flex;
    font-weight: 700;
    min-height: 44px;
    padding: 10px 16px;
    text-decoration: none;
  }

  .pdmshell-button-primary {
    background: var(--pdmshell-accent);
    border-color: var(--pdmshell-accent);
    color: #fff !important;
  }

  .pdmshell-button-primary:hover {
    background: var(--pdmshell-accent-strong);
    border-color: var(--pdmshell-accent-strong);
    text-decoration: none;
  }

  .pdmshell-button-secondary {
    background: var(--bs-body-bg);
    color: var(--bs-body-color) !important;
  }

  .pdmshell-button-secondary:hover {
    border-color: var(--pdmshell-accent);
    color: var(--pdmshell-accent) !important;
    text-decoration: none;
  }

  .pdmshell-hero-media {
    background: var(--pdmshell-panel);
    border: 1px solid var(--pdmshell-border);
    border-radius: 8px;
    overflow: hidden;
  }

  .pdmshell-hero-media img,
  .pdmshell-hero-media video {
    display: block;
    height: auto;
    width: 100%;
  }

  .pdmshell-section {
    margin: 34px 0;
  }

  .pdmshell-section h2 {
    color: var(--bs-heading-color);
    font-size: 28px;
    margin-bottom: 10px;
  }

  .pdmshell-section > p {
    color: var(--pdmshell-muted);
    font-size: 16px;
    line-height: 1.6;
    max-width: 860px;
  }

  .pdmshell-grid {
    display: grid;
    gap: 14px;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    margin-top: 18px;
  }

  .pdmshell-card {
    background: var(--bs-body-bg);
    border: 1px solid var(--pdmshell-border);
    border-radius: 8px;
    display: block;
    padding: 18px;
    text-decoration: none;
  }

  .pdmshell-card:hover {
    border-color: var(--pdmshell-accent);
    text-decoration: none;
  }

  .pdmshell-card h3 {
    color: var(--bs-heading-color);
    font-size: 18px;
    margin: 0 0 8px;
  }

  .pdmshell-card p {
    color: var(--pdmshell-muted);
    line-height: 1.48;
    margin: 0;
  }

  .pdmshell-band {
    background: var(--pdmshell-panel);
    border: 1px solid var(--pdmshell-border);
    border-radius: 8px;
    padding: 22px;
  }

  .pdmshell-video-frame {
    aspect-ratio: 16 / 9;
    background: var(--pdmshell-panel);
    border: 1px solid var(--pdmshell-border);
    border-radius: 8px;
    margin: 18px auto 0;
    max-width: 720px;
    overflow: hidden;
  }

  .pdmshell-video-frame iframe {
    border: 0;
    display: block;
    height: 100%;
    width: 100%;
  }

  .pdmshell-checklist {
    display: grid;
    gap: 10px 18px;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    margin: 18px 0 0;
    padding: 0;
  }

  .pdmshell-checklist li {
    list-style: none;
    padding-left: 26px;
    position: relative;
  }

  .pdmshell-checklist li::before {
    color: var(--pdmshell-success);
    content: "\2713";
    font-weight: 800;
    left: 0;
    position: absolute;
  }

  .pdmshell-cta-row {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-top: 18px;
  }

  @media (max-width: 992px) {
    .pdmshell-hero {
      grid-template-columns: 1fr;
    }

    .pdmshell-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 640px) {
    .pdmshell-actions,
    .pdmshell-cta-row {
      align-items: stretch;
      flex-direction: column;
    }

    .pdmshell-button {
      justify-content: center;
      width: 100%;
    }

    .pdmshell-grid,
    .pdmshell-checklist {
      grid-template-columns: 1fr;
    }
  }
</style>

<div class="pdmshell-home">
  <section class="pdmshell-hero">
    <div>
      <div class="pdmshell-kicker">PDMShell for SOLIDWORKS PDM Professional</div>
      <h1 class="pdmshell-title">Automate PDM work with commands, scripts, and add-in workflows.</h1>
      <p class="pdmshell-lede">
        PDMShell is a command-line and automation platform for SOLIDWORKS PDM Professional. Use it for one-off commands, repeatable <code>.pdmshell</code> scripts, visual workflows, and administrator-controlled add-in automation directly inside PDM.
      </p>
      <div class="pdmshell-actions">
        <a class="pdmshell-button pdmshell-button-primary" href="https://bluebyte.biz/wp-json/slm_custom/downloadpdmshell">Download PDMShell</a>
        <a class="pdmshell-button pdmshell-button-secondary" href="howtoinstall.md">Install or update</a>
        <a class="pdmshell-button pdmshell-button-secondary" href="licensing.md">Choose licensing</a>
      </div>
    </div>
    <div class="pdmshell-hero-media">
      <video autoplay muted loop playsinline poster="../images/pdmshell-home-visual-editor.png" aria-label="PDMShell visual editor showing a SOLIDWORKS PDM automation workflow and command-line output">
        <source src="../images/visual-editor.mp4" type="video/mp4">
      </video>
    </div>
  </section>
  <section class="pdmshell-section">
    <h2>Start with the right path</h2>
    <p>Use these articles to install PDMShell, choose the correct license model, and decide how your team will run automation.</p>
    <div class="pdmshell-grid">
      <a class="pdmshell-card" href="introduction.md">
        <h3>Introduction</h3>
        <p>Learn what PDMShell does and how it fits command-line, script, visual, and add-in workflows.</p>
      </a>
      <a class="pdmshell-card" href="howtoinstall.md">
        <h3>Install or Update</h3>
        <p>Download PDMShell, install the latest version, and avoid common update issues.</p>
      </a>
      <a class="pdmshell-card" href="licensing.md">
        <h3>Licensing</h3>
        <p>Choose online activation, offline activation, a machine license, or a vault license pool.</p>
      </a>
      <a class="pdmshell-card" href="FREEVSPREMIUM.md">
        <h3>Free vs Premium</h3>
        <p>Compare limits, Premium features, single licenses, pool licenses, and pricing.</p>
      </a>
      <a class="pdmshell-card" href="scripting.md">
        <h3>Build Scripts</h3>
        <p>Save repeatable <code>.pdmshell</code> scripts and run them from PDMShell, <code>pdmcli.exe</code>, or integrations.</p>
      </a>
      <a class="pdmshell-card" href="TASKSCRIPT.md">
        <h3>PDMShell Add-In</h3>
        <p>Run scripts from PDM right-click menus and trigger points with permissions and conditions.</p>
      </a>
    </div>
  </section>
  <section class="pdmshell-section">
    <h2>Choose the workflow that fits the job</h2>
    <p>PDMShell can be used as an interactive command shell, a script runner, an add-in automation layer, or a visual workflow editor.</p>
    <div class="pdmshell-grid">
      <a class="pdmshell-card" href="COMMANDS.md">
        <h3>Command Reference</h3>
        <p>Browse commands for vault navigation, file operations, variables, automation, search, and migration.</p>
      </a>
      <a class="pdmshell-card" href="visual-code-editor-4.md">
        <h3>Visual Code Editor</h3>
        <p>Build, validate, and reuse PDMShell workflows visually.</p>
      </a>
      <a class="pdmshell-card" href="EVAL.md">
        <h3>Placeholders</h3>
        <p>Use file, folder, variable, date, global, and string function placeholders in scripts.</p>
      </a>
      <a class="pdmshell-card" href="expression-evaluator.md">
        <h3>Expression Evaluator</h3>
        <p>Test placeholders, PDM variables, and string functions before running automation.</p>
      </a>
      <a class="pdmshell-card" href="conditions.md">
        <h3>Conditions</h3>
        <p>Use the same condition syntax in IF statements, waiting, and add-in rules.</p>
      </a>
      <a class="pdmshell-card" href="advancedsearch.md">
        <h3>Advanced Search</h3>
        <p>Find PDM files with tokens, variables, favorites, result shaping, and recursive filters.</p>
      </a>
      <a class="pdmshell-card" href="faq.md">
        <h3>FAQ</h3>
        <p>Find answers about licensing, installation, the add-in, reseller use, and support.</p>
      </a>
    </div>
  </section>
  <section class="pdmshell-section pdmshell-band">
    <h2>Built for PDM administrators and migration work</h2>
    <p>Use PDMShell to automate repetitive vault work, reduce manual clicks, and standardize batch operations across teams.</p>
    <ul class="pdmshell-checklist">
      <li>Check in, check out, rename, move, copy, delete, and recover files.</li>
      <li>Run SOLIDWORKS macros and PDM tasks against search results.</li>
      <li>Read and write variables, revisions, references, BOMs, and file history.</li>
      <li>Use the add-in to expose approved scripts inside SOLIDWORKS PDM.</li>
      <li>Build reusable script templates for users and administrators.</li>
      <li>Run automation from scripts, command menus, transitions, or scheduled jobs.</li>
    </ul>
  </section>
  <section class="pdmshell-section pdmshell-band">
    <h2>Need help planning automation?</h2>
    <p>Blue Byte Systems can help design PDMShell scripts, add-in workflows, migration utilities, and vault automation for your SOLIDWORKS PDM environment.</p>
    <div class="pdmshell-cta-row">
      <a class="pdmshell-button pdmshell-button-primary" href="https://bluebyte.biz/product/enterprise-support-services/">Enterprise Support Services</a>
      <a class="pdmshell-button pdmshell-button-secondary" href="faq.md">Read the FAQ</a>
      <a class="pdmshell-button pdmshell-button-secondary" href="releasenotes.md">Read the changelog</a>
    </div>
  </section>
  <section class="pdmshell-section">
    <h2>Legacy PDMShell overview</h2>
    <p>Watch the December 2025 overview for a quick look at the command-line workflow that started the product. Some screens may look different from the current version.</p>
    <div class="pdmshell-video-frame">
      <iframe src="https://www.youtube.com/embed/UgNCkIuo-CM" title="Legacy PDMShell overview from December 2025" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
  </section>
</div>
