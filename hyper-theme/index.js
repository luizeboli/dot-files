'use strict';

const backgroundColor = '#191622';
const foregroundColor = '#FFFFFF80';
const borderColor = '#2a2637';
const cursorColor = '#00AEEF';
const cursorBlink = true;
const colors = {
  black: '#000000',
  red: '#ff5555',
  green: '#50fa7b',
  yellow: '#f1fa8c',
  blue: '#2B3640',
  magenta: '#ff79c6',
  cyan: '#8be9fd',
  white: '#bfbfbf',
  lightBlack: '#95A5B2',
  lightRed: '#ff6e67',
  lightGreen: '#5af78e',
  lightYellow: '#f4f99d',
  lightBlue: '#00AEEF',
  lightMagenta: '#ff92d0',
  lightCyan: '#9aedfe',
  lightWhite: '#b1c5d6'
};

exports.decorateConfig = config => {
  return Object.assign({}, config, {
    backgroundColor,
    foregroundColor,
    borderColor,
    cursorColor,
    cursorBlink,
    colors,
    termCSS: `
      ${config.termCSS || ''}
    `,
    css: `
      ${config.css || ''}
      .tabs_list .tab_tab.tab_active .tab_text  {
        background: ${backgroundColor};
      }

      .tab_active:before {
        border-color: ${borderColor};
      }

      .hyper_main {
        border-color: ${borderColor} !important;
      }
    `
  });
};