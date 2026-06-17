---
uid: index
title: PDMShell 
description: PowerShell like commandline interpreter and data migration tool for SOLIDWORKS PDM Professional.
---

<style>
  body {
    background-color: #121212;
    color: #e0e0e0;
    font-family: Arial, sans-serif;
    margin: 0;
  }

  h1, h2, h3 {
    color: #ffffff;
  }

  p {
    color: #d9d9d9;
    line-height: 1.55;
  }

  a {
    color: #bb86fc;
    text-decoration: none;
  }

  a:hover {
    text-decoration: underline;
  }

  .home-hero {
    background: #171717;
    border: 1px solid #2d2d2d;
    border-radius: 10px;
    padding: 30px;
    margin: 10px auto 28px;
    max-width: 1120px;
  }

  .home-eyebrow {
    color: #bb86fc;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: .08em;
    text-transform: uppercase;
  }

  .home-title {
    font-size: 38px;
    line-height: 1.15;
    margin: 10px 0 14px;
  }

  .home-lede {
    color: #e7e7e7;
    font-size: 18px;
    max-width: 860px;
  }

  .feature-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
    gap: 16px;
    margin: 24px 0 6px;
  }

  .hero-image {
    border: 1px solid #343434;
    border-radius: 8px;
    display: block;
    margin: 0 0 24px;
    max-width: 100%;
  }

  .feature-card {
    background-color: #1f1f1f;
    border: 1px solid #343434;
    border-radius: 8px;
    padding: 18px;
  }

  .feature-card h2 {
    color: #ffffff;
    font-size: 22px;
    margin: 0 0 10px;
  }

  .feature-card p {
    margin: 0 0 14px;
  }

  .home-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    margin-top: 22px;
  }

  .download-button,
  .secondary-button {
    border-radius: 8px;
    display: inline-block;
    font-weight: bold;
    padding: 11px 18px;
  }

  .download-button {
    background-color: #bb86fc;
    color: #ffffff;
    text-transform: uppercase;
  }

  .download-button:hover {
    background-color: #9b6fcf;
    text-decoration: none;
  }

  .secondary-button {
    background-color: #262626;
    border: 1px solid #454545;
    color: #ffffff;
  }

  .secondary-button:hover {
    border-color: #bb86fc;
    text-decoration: none;
  }

  .quick-links {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
    gap: 14px;
    margin: 28px auto;
    max-width: 1120px;
  }

  .quick-link {
    background-color: #1f1f1f;
    border: 1px solid #333;
    border-radius: 8px;
    display: block;
    padding: 16px;
  }

  .quick-link strong {
    color: #ffffff;
    display: block;
    font-size: 18px;
    margin-bottom: 6px;
  }

  .quick-link span {
    color: #cfcfcf;
    display: block;
    line-height: 1.4;
  }

  .content-section {
    margin: 30px auto;
    max-width: 1120px;
  }

  .video-container {
    background-color: #000000;
    border: 1px solid #2d2d2d;
    border-radius: 10px;
    margin: 38px auto 0;
    max-width: 1120px;
    padding: 22px;
    text-align: center;
  }

  .video-container iframe {
    border-radius: 8px;
    max-width: 100%;
  }

  @media (max-width: 768px) {
    .home-title {
      font-size: 30px;
    }

    .home-hero {
      padding: 22px;
    }
  }
</style>

<div class="home-hero">
  <div class="home-eyebrow">PDMShell for SOLIDWORKS PDM Professional</div>
  <h1 class="home-title">Automate PDM with scripts, menus, event triggers, and a visual editor.</h1>
  <p class="home-lede">
    PDMShell is a command-line and automation platform for SOLIDWORKS PDM Professional. Use it for one-off commands, repeatable `.pdmshell` scripts, visual workflows, and Dispatch-style add-in automation directly inside PDM.
  </p>

  <img class="hero-image" src="../images/pdmshell-addin-visual-editor.png" alt="PDMShell add-in Script Editor beside the PDMShell Visual Code Editor in SOLIDWORKS PDM Administration">

  <div class="feature-grid">
    <div class="feature-card">
      <h2>PDMShell add-in</h2>
      <p>Run scripts from PDM right-click menus and event trigger points, with permissions, conditions, placeholders, and headless execution.</p>
      <a href="TASKSCRIPT.md">Read the add-in guide</a>
    </div>
    <div class="feature-card">
      <h2>Visual Code Editor</h2>
      <p>Build, edit, validate, and reuse PDMShell scripts from a workflow-style visual canvas.</p>
      <a href="visual-code-editor-4.md">Open the visual editor docs</a>
    </div>
  </div>

  <div class="home-actions">
    <a href="https://bluebyte.biz/wp-json/slm_custom/downloadpdmshell" class="download-button">Download PDMShell directly</a>
    <a href="introduction.md" class="secondary-button">Start with the basics</a>
  </div>
</div>

<div class="quick-links">
  <a class="quick-link" href="TASKSCRIPT.md">
    <strong>PDMShell add-in</strong>
    <span>Configure PDM menu commands, event trigger points, conditions, and permissions.</span>
  </a>
  <a class="quick-link" href="visual-code-editor-4.md">
    <strong>Visual Code Editor</strong>
    <span>Build and validate workflows on a visual canvas.</span>
  </a>
  <a class="quick-link" href="COMMANDS.md">
    <strong>Command Reference</strong>
    <span>Browse commands, categories, examples, and availability.</span>
  </a>
  <a class="quick-link" href="scripting.md">
    <strong>Scripting</strong>
    <span>Automate repeated workflows with `.pdmshell` scripts.</span>
  </a>
  <a class="quick-link" href="RUNSCRIPT.md">
    <strong>RunScript</strong>
    <span>Run `.pdmshell` files from PDMShell, `pdmcli.exe`, or integrations.</span>
  </a>
  <a class="quick-link" href="advancedsearch.md">
    <strong>Advanced Search</strong>
    <span>Use search tokens, variables, favorites, and recursive filters.</span>
  </a>
</div>

<div class="content-section">
  <h2>Need more power? Choose Premium.</h2>
  <p>Upgrade to the <strong>Premium Version</strong> of PDMShell to unlock advanced automation features for PDM administrators and power users.</p>

  <ul>
    <li>Use the <strong>PDMShell add-in</strong> to run scripts from PDM command menus and event trigger points.</li>
    <li>Build workflows with the <strong>Visual Code Editor</strong>.</li>
    <li>Call PDMShell directly from other applications.</li>
    <li>Run PDMShell as a workflow transition action.</li>
    <li>Process an unlimited number of files.</li>
  </ul>

  <p><a href="https://bluebyte.biz/product/pdmshell">Buy the Premium Version Now</a></p>
  <p>Need more information or want to discuss how PDMShell can fit into your workflow? <a href="https://calendly.com/bluebyte">Schedule a call</a>.</p>
</div>

<div class="video-container">
  <h2>PDMShell walkthrough</h2>
  <iframe width="850" height="500" src="https://www.youtube.com/embed/UgNCkIuo-CM?si=h3U4PrZX-ES0bC8T" title="PDMShell walkthrough video" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
  <p>A 29-minute walkthrough of PDMShell covering the most commonly used commands.</p>
</div>

## Contact Us

For more information or to get in touch with our support team, please refer to the [Contact Us](https://bluebyte.biz/contact) page.

*See EULA page for licensing requirements and restrictions for SOLIDWORKS partners and resellers.
