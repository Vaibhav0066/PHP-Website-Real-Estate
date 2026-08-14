/*
 * Small JavaScript template helper required by jquery.slider.js.
 * Supports <%= value %> interpolation and <%- value %> escaped interpolation.
 */
(function (global) {
    'use strict';

    function escapeHtml(value) {
        return String(value == null ? '' : value)
            .replace(/&/g, '&amp;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;');
    }

    global.tmpl = function (template, data) {
        var render = new Function('data', 'escapeHtml',
            "var output=''; with(data || {}) { output += '" +
            String(template)
                .replace(/\\/g, '\\\\')
                .replace(/'/g, "\\'")
                .replace(/[\r\n\t]/g, ' ')
                .replace(/<%-([\s\S]+?)%>/g, "' + escapeHtml($1) + '")
                .replace(/<%=([\s\S]+?)%>/g, "' + ($1 == null ? '' : $1) + '")
                .replace(/<%([\s\S]+?)%>/g, "'; $1 output += '") +
            "'; } return output;");
        return arguments.length > 1 ? render(data, escapeHtml) : function (values) { return render(values, escapeHtml); };
    };
}(window));
