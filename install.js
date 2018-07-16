const { exec } = require('child_process');
const os = require('os');
const path = require('path');
const fs = require('fs');

const $HOME = os.homedir();
const $DOTFILES = path.resolve(__dirname, './');
const EXCLUDES = ['.', '..', 'install.js', 'LICENSE', 'README.md', '.git'];
const BREW_INSTALLS = ['ag', 'bash-completion'];
const WANTED_FILES = fs
  .readdirSync($DOTFILES)
  .filter(f => !EXCLUDES.includes(f));
const NVM_URL =
  'https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh';

const installations = [
  `brew install ${BREW_INSTALLS.join(' ')}`,
  `curl -o- ${NVM_URL} | bash`,
];

console.log(installations);
console.log(path.join($HOME, '.bashrc'));

const ln = f =>
  exec(`ln -sf ${path.join($DOTFILES, f)} ${path.join($HOME, f)}`);

const install = () => installations.forEach(i => exec(i));
const symlinks = () => WANTED_FILES.forEach(ln);
const source = () => exec(`source ${path.join($HOME, '.bashrc')}`);

// install();
symlinks();
source();
