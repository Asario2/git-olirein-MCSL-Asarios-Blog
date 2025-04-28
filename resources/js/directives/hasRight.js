// directives/hasRight.js
export default {
  mounted(el, binding) {
    const [right, table] = binding.arg.split('.');
    const rights = window.userRights || {};
    const positions = window.adminTablePositions || {};
    const index = positions[table];

    const bin = rights?.[`${right}_table`];
    const allowed = bin?.[index] === '1';

    if (!allowed) {
      el.parentNode && el.parentNode.removeChild(el);
    }
  }
}