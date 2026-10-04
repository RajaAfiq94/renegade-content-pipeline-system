/**
 * Shared browser launcher for the export scripts.
 * Uses Playwright and the Chromium already installed in the cloud workspace,
 * so no npm install or browser download is needed.
 */

const fs = require('fs');
const path = require('path');

function loadPlaywright() {
  const candidates = [
    'playwright',
    '/opt/node-tools/node_modules/playwright',
    '/opt/node22/lib/node_modules/playwright'
  ];
  for (const c of candidates) {
    try { return require(c); } catch (e) { /* try next */ }
  }
  throw new Error('Playwright not found. Install it with "npm i playwright" or use a workspace that preinstalls it.');
}

function findChromium() {
  if (process.env.PUPPETEER_EXECUTABLE_PATH) return process.env.PUPPETEER_EXECUTABLE_PATH;
  const root = process.env.PLAYWRIGHT_BROWSERS_PATH || '/opt/pw-browsers';
  if (!fs.existsSync(root)) return undefined;
  const dirs = fs.readdirSync(root).filter(d => /^chromium-\d+$/.test(d)).sort().reverse();
  for (const d of dirs) {
    const p = path.join(root, d, 'chrome-linux', 'chrome');
    if (fs.existsSync(p)) return p;
  }
  return undefined;
}

async function launch() {
  const { chromium } = loadPlaywright();
  return chromium.launch({
    headless: true,
    executablePath: findChromium(),
    args: ['--no-sandbox']
  });
}

module.exports = { launch };
