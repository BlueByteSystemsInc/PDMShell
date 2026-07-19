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
    gap: 20px;
    justify-items: center;
    margin: 8px 0 34px;
    text-align: center;
  }

  .pdmshell-hero-copy {
    max-width: 900px;
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
    margin: 0 auto;
    max-width: 820px;
  }

  .pdmshell-actions {
    display: grid;
    gap: 10px;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    margin-top: 2px;
    max-width: 620px;
    width: 100%;
  }

  .pdmshell-button {
    align-items: center;
    border: 1px solid var(--pdmshell-border);
    border-radius: 8px;
    display: inline-flex;
    font-weight: 700;
    justify-content: center;
    line-height: 1.2;
    min-height: 44px;
    padding: 10px 16px;
    text-decoration: none;
    text-align: center;
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
    max-width: 920px;
    overflow: hidden;
    width: 100%;
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

  .pdmshell-workflow-grid {
    grid-template-columns: repeat(4, minmax(0, 1fr));
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
    .pdmshell-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .pdmshell-workflow-grid {
      grid-template-columns: repeat(2, minmax(0, 1fr));
    }
  }

  @media (max-width: 640px) {
    .pdmshell-cta-row {
      align-items: stretch;
      flex-direction: column;
    }

    .pdmshell-actions {
      grid-template-columns: 1fr;
    }

    .pdmshell-button {
      width: 100%;
    }

    .pdmshell-grid,
    .pdmshell-workflow-grid,
    .pdmshell-checklist {
      grid-template-columns: 1fr;
    }
  }
</style>

<div class="pdmshell-home">
  <section class="pdmshell-hero">
    <div class="pdmshell-hero-copy">
      <div class="pdmshell-kicker">PDMShell for SOLIDWORKS PDM Professional</div>
      <h1 class="pdmshell-title">Move past <s>Dispatch</s>. Automate PDM with PDMShell.</h1>
      <p class="pdmshell-lede">
        Run scripts on demand, from PDM events, or as tasks inside SOLIDWORKS PDM Professional. Use PDMShell for one-off commands, repeatable <code>.pdmshell</code> scripts, visual workflows, and administrator-controlled add-in automation.
      </p>
    </div>
    <div class="pdmshell-hero-media">
      <video autoplay muted loop playsinline poster="../images/pdmshell-home-visual-editor.png" aria-label="PDMShell visual editor showing a SOLIDWORKS PDM automation workflow and command-line output">
        <source src="../images/visual-editor.mp4" type="video/mp4">
      </video>
    </div>
    <div class="pdmshell-actions">
      <a class="pdmshell-button pdmshell-button-primary" href="https://bluebyte.biz/wp-json/slm_custom/downloadpdmshell">Install Program (MSI Installer)</a>
      <a class="pdmshell-button pdmshell-button-secondary" href="addin/installation.md">Install PDM Add-in</a>
      <a class="pdmshell-button pdmshell-button-secondary" href="licensing.md">Licensing</a>
    </div>
  </section>
  <section class="pdmshell-section">
    <h2>Start with the right path</h2>
    <p>Install the pieces you need, then choose the licensing model that matches how your team will use PDMShell.</p>
    <div class="pdmshell-grid">
      <a class="pdmshell-card" href="howtoinstall.md">
        <h3>Install PDMShell (MSI installer)</h3>
        <p>Install the standalone desktop app for command-line work, script editing, and single-machine activation.</p>
      </a>
      <a class="pdmshell-card" href="addin/installation.md">
        <h3>Install PDM Add-in</h3>
        <p>Install the SOLIDWORKS PDM add-in with PDMDeploy or the Microsoft-hosted Download Center.</p>
      </a>
      <a class="pdmshell-card" href="licensing.md">
        <h3>How licensing works</h3>
        <p>Choose single-machine activation in the standalone app or pooled add-in licensing from the PDM Administration Tool.</p>
      </a>
    </div>
  </section>
  <section class="pdmshell-section">
    <h2>Choose the workflow that fits the job</h2>
    <p>Pick the simplest workflow for the task: one command, a reusable script, a visual workflow, or controlled automation inside PDM.</p>
    <div class="pdmshell-grid pdmshell-workflow-grid">
      <a class="pdmshell-card" href="COMMANDS.md">
        <h3>Run a command</h3>
        <p>Use the command shell for quick vault navigation, file operations, search, variables, and cleanup work.</p>
      </a>
      <a class="pdmshell-card" href="scripting.md">
        <h3>Build a script</h3>
        <p>Save repeatable <code>.pdmshell</code> scripts for batch work, migrations, and administrator tasks.</p>
      </a>
      <a class="pdmshell-card" href="visual-code-editor-4.md">
        <h3>Build visually</h3>
        <p>Create and validate workflows with the visual editor when a script benefits from a guided layout.</p>
      </a>
      <a class="pdmshell-card" href="TASKSCRIPT.md">
        <h3>Automate inside PDM</h3>
        <p>Run approved scripts from PDM command menus, tasks, and trigger points with permissions and conditions.</p>
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
    <h2>PDMShell add-in demo</h2>
    <p>Watch how a PDMShell add-in script can run on demand from SOLIDWORKS PDM command menus without creating a PDM Task.</p>
    <div class="pdmshell-video-frame">
      <iframe src="https://www.youtube.com/embed/S7YZ04am8pI" title="Run PDMShell scripts on demand from SOLIDWORKS PDM" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
    </div>
  </section>
</div>
