'use strict';

var obsidian = require('obsidian');

/*! *****************************************************************************
Copyright (c) Microsoft Corporation.

Permission to use, copy, modify, and/or distribute this software for any
purpose with or without fee is hereby granted.

THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH
REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY
AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT,
INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM
LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR
OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
PERFORMANCE OF THIS SOFTWARE.
***************************************************************************** */
/* global Reflect, Promise */

var extendStatics = function(d, b) {
    extendStatics = Object.setPrototypeOf ||
        ({ __proto__: [] } instanceof Array && function (d, b) { d.__proto__ = b; }) ||
        function (d, b) { for (var p in b) if (Object.prototype.hasOwnProperty.call(b, p)) d[p] = b[p]; };
    return extendStatics(d, b);
};

function __extends(d, b) {
    if (typeof b !== "function" && b !== null)
        throw new TypeError("Class extends value " + String(b) + " is not a constructor or null");
    extendStatics(d, b);
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
}

function __awaiter(thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
}

function __generator(thisArg, body) {
    var _ = { label: 0, sent: function() { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function() { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
}

var DEFAULT_SETTINGS = {
    outputFileName: "Find unlinked files plugin output",
    disableWorkingLinks: false,
    directoriesToIgnore: [],
    filesToIgnore: [],
    fileTypesToIgnore: [],
    linksToIgnore: [],
    tagsToIgnore: [],
    fileTypesToDelete: [],
};
var FindUnlinkedFilesPlugin = /** @class */ (function (_super) {
    __extends(FindUnlinkedFilesPlugin, _super);
    function FindUnlinkedFilesPlugin() {
        return _super !== null && _super.apply(this, arguments) || this;
    }
    FindUnlinkedFilesPlugin.prototype.onload = function () {
        return __awaiter(this, void 0, void 0, function () {
            var _this = this;
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0:
                        console.log('loading ' + this.manifest.name + " plugin");
                        return [4 /*yield*/, this.loadSettings()];
                    case 1:
                        _a.sent();
                        this.addCommand({
                            id: 'find-unlinked-files',
                            name: 'Find unlinked files',
                            callback: function () { return __awaiter(_this, void 0, void 0, function () {
                                var outFile, files, markdownFiles, links, notLinkedFiles, text, prefix, fileIsAlreadyOpened;
                                var _this = this;
                                return __generator(this, function (_a) {
                                    switch (_a.label) {
                                        case 0:
                                            outFile = this.settings.outputFileName + ".md";
                                            files = this.app.vault.getFiles();
                                            markdownFiles = this.app.vault.getMarkdownFiles();
                                            links = [];
                                            markdownFiles.forEach(function (markFile) {
                                                if (markFile.path == outFile)
                                                    return;
                                                obsidian.iterateCacheRefs(_this.app.metadataCache.getFileCache(markFile), function (cb) {
                                                    var txt = _this.app.metadataCache.getFirstLinkpathDest(obsidian.getLinkpath(cb.link), markFile.path);
                                                    if (txt != null)
                                                        links.push(txt.path);
                                                });
                                            });
                                            notLinkedFiles = [];
                                            files.forEach(function (file) {
                                                if (file.path == outFile)
                                                    return;
                                                //filetypes to ignore by default
                                                if (["css"].contains(file.extension))
                                                    return;
                                                if (_this.settings.fileTypesToIgnore.contains(file.extension))
                                                    return;
                                                if (_this.findLinksToIgnore(file))
                                                    return;
                                                if (_this.findTagsToIgnore(file))
                                                    return;
                                                if (_this.findDirectoryToIgnore(file))
                                                    return;
                                                if (_this.settings.filesToIgnore.contains(file.path))
                                                    return;
                                                if (links.contains(file.path))
                                                    return;
                                                notLinkedFiles.push(file);
                                            });
                                            text = "";
                                            if (this.settings.disableWorkingLinks)
                                                prefix = "	";
                                            else
                                                prefix = "";
                                            notLinkedFiles.forEach(function (file) {
                                                text += prefix + "- [[" + _this.app.metadataCache.fileToLinktext(file, "/") + "]]\n";
                                            });
                                            return [4 /*yield*/, this.app.vault.adapter.write(outFile, text)];
                                        case 1:
                                            _a.sent();
                                            fileIsAlreadyOpened = false;
                                            this.app.workspace.iterateAllLeaves(function (leaf) {
                                                if (outFile.startsWith(leaf.getDisplayText())) {
                                                    fileIsAlreadyOpened = true;
                                                }
                                            });
                                            if (!fileIsAlreadyOpened)
                                                this.app.workspace.openLinkText(outFile, "/", true);
                                            return [2 /*return*/];
                                    }
                                });
                            }); },
                        });
                        this.addCommand({
                            id: "delete-unlinked-files",
                            name: "Delete unlinked files with certain extension. See README",
                            callback: function () {
                                var _a, _b;
                                var links = (_b = (_a = _this.app.metadataCache.getCache(_this.settings.outputFileName + ".md")) === null || _a === void 0 ? void 0 : _a.links) !== null && _b !== void 0 ? _b : [];
                                var filesToDelete = [];
                                links.forEach(function (link) {
                                    var file = _this.app.metadataCache.getFirstLinkpathDest(link.link, "/");
                                    if (!file)
                                        return;
                                    if (_this.settings.fileTypesToDelete.contains(file.extension)) {
                                        filesToDelete.push(file);
                                    }
                                });
                                if (filesToDelete.length > 0)
                                    new DeleteFilesModal(_this.app, filesToDelete).open();
                            }
                        });
                        this.addSettingTab(new SettingsTab(this.app, this));
                        return [2 /*return*/];
                }
            });
        });
    };
    FindUnlinkedFilesPlugin.prototype.findDirectoryToIgnore = function (file) {
        var found = false;
        this.settings.directoriesToIgnore.forEach(function (value) {
            if (file.path.startsWith(value) && value.length != 0)
                found = true;
        });
        return found;
    };
    FindUnlinkedFilesPlugin.prototype.findLinksToIgnore = function (file) {
        var _this = this;
        var found = false;
        obsidian.iterateCacheRefs(this.app.metadataCache.getFileCache(file), function (cb) {
            var _a;
            var link = (_a = _this.app.metadataCache.getFirstLinkpathDest(cb.link, file.path)) === null || _a === void 0 ? void 0 : _a.path;
            if (!link)
                return;
            if (_this.settings.linksToIgnore.contains(link))
                found = true;
        });
        return found;
    };
    FindUnlinkedFilesPlugin.prototype.findTagsToIgnore = function (file) {
        var _this = this;
        var found = false;
        var tags = obsidian.getAllTags(this.app.metadataCache.getFileCache(file));
        if (tags) {
            tags.forEach(function (tag) {
                if (_this.settings.tagsToIgnore.contains(tag.substring(1)))
                    found = true;
            });
            return found;
        }
        else {
            return false;
        }
    };
    FindUnlinkedFilesPlugin.prototype.onunload = function () {
        console.log('unloading ' + this.manifest.name + " plugin");
    };
    FindUnlinkedFilesPlugin.prototype.loadSettings = function () {
        return __awaiter(this, void 0, void 0, function () {
            var _a, _b, _c, _d;
            return __generator(this, function (_e) {
                switch (_e.label) {
                    case 0:
                        _a = this;
                        _c = (_b = Object).assign;
                        _d = [DEFAULT_SETTINGS];
                        return [4 /*yield*/, this.loadData()];
                    case 1:
                        _a.settings = _c.apply(_b, _d.concat([_e.sent()]));
                        return [2 /*return*/];
                }
            });
        });
    };
    FindUnlinkedFilesPlugin.prototype.saveSettings = function () {
        return __awaiter(this, void 0, void 0, function () {
            return __generator(this, function (_a) {
                switch (_a.label) {
                    case 0: return [4 /*yield*/, this.saveData(this.settings)];
                    case 1:
                        _a.sent();
                        return [2 /*return*/];
                }
            });
        });
    };
    return FindUnlinkedFilesPlugin;
}(obsidian.Plugin));
var DeleteFilesModal = /** @class */ (function (_super) {
    __extends(DeleteFilesModal, _super);
    function DeleteFilesModal(app, filesToDelete) {
        var _this = _super.call(this, app) || this;
        _this.filesToDelete = filesToDelete;
        return _this;
    }
    DeleteFilesModal.prototype.onOpen = function () {
        var _this = this;
        var _a = this, contentEl = _a.contentEl, titleEl = _a.titleEl;
        titleEl.setText('Move ' + this.filesToDelete.length + ' files to system trash?');
        contentEl
            .createEl("button", { text: "Cancel" })
            .addEventListener("click", function () { return _this.close(); });
        contentEl
            .setAttr("margin", "auto");
        contentEl
            .createEl("button", {
            cls: "mod-cta",
            text: "Confirm"
        })
            .addEventListener("click", function () { return __awaiter(_this, void 0, void 0, function () {
            var _i, _a, file;
            return __generator(this, function (_b) {
                switch (_b.label) {
                    case 0:
                        _i = 0, _a = this.filesToDelete;
                        _b.label = 1;
                    case 1:
                        if (!(_i < _a.length)) return [3 /*break*/, 4];
                        file = _a[_i];
                        return [4 /*yield*/, this.app.vault.trash(file, true)];
                    case 2:
                        _b.sent();
                        _b.label = 3;
                    case 3:
                        _i++;
                        return [3 /*break*/, 1];
                    case 4:
                        this.close();
                        return [2 /*return*/];
                }
            });
        }); });
    };
    DeleteFilesModal.prototype.onClose = function () {
        var contentEl = this.contentEl;
        contentEl.empty();
    };
    return DeleteFilesModal;
}(obsidian.Modal));
var SettingsTab = /** @class */ (function (_super) {
    __extends(SettingsTab, _super);
    function SettingsTab(app, plugin) {
        var _this = _super.call(this, app, plugin) || this;
        _this.plugin = plugin;
        return _this;
    }
    SettingsTab.prototype.display = function () {
        var _this = this;
        var containerEl = this.containerEl;
        containerEl.empty();
        containerEl.createEl("h2", { text: this.plugin.manifest.name });
        new obsidian.Setting(containerEl)
            .setName('Output file name')
            .setDesc('Set name of output file (without file extension). Make sure no file exists with this name because it will be overwritten! If the name is empty, the default name is set.')
            .addText(function (cb) { return cb.onChange(function (value) {
            if (value.length == 0) {
                _this.plugin.settings.outputFileName = "Find unlinked files plugin output";
            }
            else {
                _this.plugin.settings.outputFileName = value;
            }
            _this.plugin.saveSettings();
        }).setValue(_this.plugin.settings.outputFileName); });
        new obsidian.Setting(containerEl)
            .setName('Disable working links')
            .setDesc('Indent lines to disable the link and to clean up the graph view')
            .addToggle(function (cb) { return cb.onChange(function (value) {
            _this.plugin.settings.disableWorkingLinks = value;
            _this.plugin.saveSettings();
        }).setValue(_this.plugin.settings.disableWorkingLinks); });
        new obsidian.Setting(containerEl)
            .setName("Directories to ignore.")
            .setDesc("Add each directory path in a new line")
            .addTextArea(function (cb) { return cb
            .setPlaceholder("Directory/Subdirectory")
            .setValue(_this.plugin.settings.directoriesToIgnore.join("\n"))
            .onChange(function (value) {
            var paths = value.trim().split("\n").map(function (value) { return formatPath(value, true); });
            _this.plugin.settings.directoriesToIgnore = paths;
            _this.plugin.saveSettings();
        }); });
        new obsidian.Setting(containerEl)
            .setName("Files to ignore.")
            .setDesc("Add each file path in a new line (with file extension!)")
            .addTextArea(function (cb) { return cb
            .setPlaceholder("Directory/file.md")
            .setValue(_this.plugin.settings.filesToIgnore.join("\n"))
            .onChange(function (value) {
            var paths = value.trim().split("\n").map(function (value) { return formatPath(value, false); });
            _this.plugin.settings.filesToIgnore = paths;
            _this.plugin.saveSettings();
        }); });
        new obsidian.Setting(containerEl)
            .setName("Links to ignore.")
            .setDesc("Ignores files, which contain the given file as link. Add each file path in a new line (with file extension!)")
            .addTextArea(function (cb) { return cb
            .setPlaceholder("Directory/file.md")
            .setValue(_this.plugin.settings.linksToIgnore.join("\n"))
            .onChange(function (value) {
            var paths = value.trim().split("\n").map(function (value) { return formatPath(value, false); });
            _this.plugin.settings.linksToIgnore = paths;
            _this.plugin.saveSettings();
        }); });
        new obsidian.Setting(containerEl)
            .setName("Filetypes to ignore.")
            .setDesc("Add each filetype separated by comma")
            .addTextArea(function (cb) { return cb
            .setPlaceholder("docx,txt")
            .setValue(_this.plugin.settings.fileTypesToIgnore.join(","))
            .onChange(function (value) {
            var extensions = value.trim().split(",");
            _this.plugin.settings.fileTypesToIgnore = extensions;
            _this.plugin.saveSettings();
        }); });
        new obsidian.Setting(containerEl)
            .setName("Tags to ignore.")
            .setDesc("Ignore files, which contain the given tag. Add each tag separated by comma (without `#`)")
            .addTextArea(function (cb) { return cb
            .setPlaceholder("todo,unfinished")
            .setValue(_this.plugin.settings.tagsToIgnore.join(","))
            .onChange(function (value) {
            var tags = value.trim().split(",");
            _this.plugin.settings.tagsToIgnore = tags;
            _this.plugin.saveSettings();
        }); });
        new obsidian.Setting(containerEl)
            .setName("Filetypes to delete per command. See README.")
            .setDesc("Add each filetype separated by comma. ")
            .addTextArea(function (cb) { return cb
            .setPlaceholder("jpg,png")
            .setValue(_this.plugin.settings.fileTypesToDelete.join(","))
            .onChange(function (value) {
            var extensions = value.trim().split(",");
            _this.plugin.settings.fileTypesToDelete = extensions;
            _this.plugin.saveSettings();
        }); });
        function formatPath(path, addDirectorySlash) {
            if (path.length == 0)
                return path;
            path = obsidian.normalizePath(path);
            if (addDirectorySlash)
                return path + "/";
            else
                return path;
        }
    };
    return SettingsTab;
}(obsidian.PluginSettingTab));

module.exports = FindUnlinkedFilesPlugin;
//# sourceMappingURL=data:application/json;charset=utf-8;base64,eyJ2ZXJzaW9uIjozLCJmaWxlIjoibWFpbi5qcyIsInNvdXJjZXMiOlsibm9kZV9tb2R1bGVzL3RzbGliL3RzbGliLmVzNi5qcyIsIm1haW4udHMiXSwic291cmNlc0NvbnRlbnQiOlsiLyohICoqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqXHJcbkNvcHlyaWdodCAoYykgTWljcm9zb2Z0IENvcnBvcmF0aW9uLlxyXG5cclxuUGVybWlzc2lvbiB0byB1c2UsIGNvcHksIG1vZGlmeSwgYW5kL29yIGRpc3RyaWJ1dGUgdGhpcyBzb2Z0d2FyZSBmb3IgYW55XHJcbnB1cnBvc2Ugd2l0aCBvciB3aXRob3V0IGZlZSBpcyBoZXJlYnkgZ3JhbnRlZC5cclxuXHJcblRIRSBTT0ZUV0FSRSBJUyBQUk9WSURFRCBcIkFTIElTXCIgQU5EIFRIRSBBVVRIT1IgRElTQ0xBSU1TIEFMTCBXQVJSQU5USUVTIFdJVEhcclxuUkVHQVJEIFRPIFRISVMgU09GVFdBUkUgSU5DTFVESU5HIEFMTCBJTVBMSUVEIFdBUlJBTlRJRVMgT0YgTUVSQ0hBTlRBQklMSVRZXHJcbkFORCBGSVRORVNTLiBJTiBOTyBFVkVOVCBTSEFMTCBUSEUgQVVUSE9SIEJFIExJQUJMRSBGT1IgQU5ZIFNQRUNJQUwsIERJUkVDVCxcclxuSU5ESVJFQ1QsIE9SIENPTlNFUVVFTlRJQUwgREFNQUdFUyBPUiBBTlkgREFNQUdFUyBXSEFUU09FVkVSIFJFU1VMVElORyBGUk9NXHJcbkxPU1MgT0YgVVNFLCBEQVRBIE9SIFBST0ZJVFMsIFdIRVRIRVIgSU4gQU4gQUNUSU9OIE9GIENPTlRSQUNULCBORUdMSUdFTkNFIE9SXHJcbk9USEVSIFRPUlRJT1VTIEFDVElPTiwgQVJJU0lORyBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBXSVRIIFRIRSBVU0UgT1JcclxuUEVSRk9STUFOQ0UgT0YgVEhJUyBTT0ZUV0FSRS5cclxuKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKiogKi9cclxuLyogZ2xvYmFsIFJlZmxlY3QsIFByb21pc2UgKi9cclxuXHJcbnZhciBleHRlbmRTdGF0aWNzID0gZnVuY3Rpb24oZCwgYikge1xyXG4gICAgZXh0ZW5kU3RhdGljcyA9IE9iamVjdC5zZXRQcm90b3R5cGVPZiB8fFxyXG4gICAgICAgICh7IF9fcHJvdG9fXzogW10gfSBpbnN0YW5jZW9mIEFycmF5ICYmIGZ1bmN0aW9uIChkLCBiKSB7IGQuX19wcm90b19fID0gYjsgfSkgfHxcclxuICAgICAgICBmdW5jdGlvbiAoZCwgYikgeyBmb3IgKHZhciBwIGluIGIpIGlmIChPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwoYiwgcCkpIGRbcF0gPSBiW3BdOyB9O1xyXG4gICAgcmV0dXJuIGV4dGVuZFN0YXRpY3MoZCwgYik7XHJcbn07XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gX19leHRlbmRzKGQsIGIpIHtcclxuICAgIGlmICh0eXBlb2YgYiAhPT0gXCJmdW5jdGlvblwiICYmIGIgIT09IG51bGwpXHJcbiAgICAgICAgdGhyb3cgbmV3IFR5cGVFcnJvcihcIkNsYXNzIGV4dGVuZHMgdmFsdWUgXCIgKyBTdHJpbmcoYikgKyBcIiBpcyBub3QgYSBjb25zdHJ1Y3RvciBvciBudWxsXCIpO1xyXG4gICAgZXh0ZW5kU3RhdGljcyhkLCBiKTtcclxuICAgIGZ1bmN0aW9uIF9fKCkgeyB0aGlzLmNvbnN0cnVjdG9yID0gZDsgfVxyXG4gICAgZC5wcm90b3R5cGUgPSBiID09PSBudWxsID8gT2JqZWN0LmNyZWF0ZShiKSA6IChfXy5wcm90b3R5cGUgPSBiLnByb3RvdHlwZSwgbmV3IF9fKCkpO1xyXG59XHJcblxyXG5leHBvcnQgdmFyIF9fYXNzaWduID0gZnVuY3Rpb24oKSB7XHJcbiAgICBfX2Fzc2lnbiA9IE9iamVjdC5hc3NpZ24gfHwgZnVuY3Rpb24gX19hc3NpZ24odCkge1xyXG4gICAgICAgIGZvciAodmFyIHMsIGkgPSAxLCBuID0gYXJndW1lbnRzLmxlbmd0aDsgaSA8IG47IGkrKykge1xyXG4gICAgICAgICAgICBzID0gYXJndW1lbnRzW2ldO1xyXG4gICAgICAgICAgICBmb3IgKHZhciBwIGluIHMpIGlmIChPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwocywgcCkpIHRbcF0gPSBzW3BdO1xyXG4gICAgICAgIH1cclxuICAgICAgICByZXR1cm4gdDtcclxuICAgIH1cclxuICAgIHJldHVybiBfX2Fzc2lnbi5hcHBseSh0aGlzLCBhcmd1bWVudHMpO1xyXG59XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gX19yZXN0KHMsIGUpIHtcclxuICAgIHZhciB0ID0ge307XHJcbiAgICBmb3IgKHZhciBwIGluIHMpIGlmIChPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwocywgcCkgJiYgZS5pbmRleE9mKHApIDwgMClcclxuICAgICAgICB0W3BdID0gc1twXTtcclxuICAgIGlmIChzICE9IG51bGwgJiYgdHlwZW9mIE9iamVjdC5nZXRPd25Qcm9wZXJ0eVN5bWJvbHMgPT09IFwiZnVuY3Rpb25cIilcclxuICAgICAgICBmb3IgKHZhciBpID0gMCwgcCA9IE9iamVjdC5nZXRPd25Qcm9wZXJ0eVN5bWJvbHMocyk7IGkgPCBwLmxlbmd0aDsgaSsrKSB7XHJcbiAgICAgICAgICAgIGlmIChlLmluZGV4T2YocFtpXSkgPCAwICYmIE9iamVjdC5wcm90b3R5cGUucHJvcGVydHlJc0VudW1lcmFibGUuY2FsbChzLCBwW2ldKSlcclxuICAgICAgICAgICAgICAgIHRbcFtpXV0gPSBzW3BbaV1dO1xyXG4gICAgICAgIH1cclxuICAgIHJldHVybiB0O1xyXG59XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gX19kZWNvcmF0ZShkZWNvcmF0b3JzLCB0YXJnZXQsIGtleSwgZGVzYykge1xyXG4gICAgdmFyIGMgPSBhcmd1bWVudHMubGVuZ3RoLCByID0gYyA8IDMgPyB0YXJnZXQgOiBkZXNjID09PSBudWxsID8gZGVzYyA9IE9iamVjdC5nZXRPd25Qcm9wZXJ0eURlc2NyaXB0b3IodGFyZ2V0LCBrZXkpIDogZGVzYywgZDtcclxuICAgIGlmICh0eXBlb2YgUmVmbGVjdCA9PT0gXCJvYmplY3RcIiAmJiB0eXBlb2YgUmVmbGVjdC5kZWNvcmF0ZSA9PT0gXCJmdW5jdGlvblwiKSByID0gUmVmbGVjdC5kZWNvcmF0ZShkZWNvcmF0b3JzLCB0YXJnZXQsIGtleSwgZGVzYyk7XHJcbiAgICBlbHNlIGZvciAodmFyIGkgPSBkZWNvcmF0b3JzLmxlbmd0aCAtIDE7IGkgPj0gMDsgaS0tKSBpZiAoZCA9IGRlY29yYXRvcnNbaV0pIHIgPSAoYyA8IDMgPyBkKHIpIDogYyA+IDMgPyBkKHRhcmdldCwga2V5LCByKSA6IGQodGFyZ2V0LCBrZXkpKSB8fCByO1xyXG4gICAgcmV0dXJuIGMgPiAzICYmIHIgJiYgT2JqZWN0LmRlZmluZVByb3BlcnR5KHRhcmdldCwga2V5LCByKSwgcjtcclxufVxyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIF9fcGFyYW0ocGFyYW1JbmRleCwgZGVjb3JhdG9yKSB7XHJcbiAgICByZXR1cm4gZnVuY3Rpb24gKHRhcmdldCwga2V5KSB7IGRlY29yYXRvcih0YXJnZXQsIGtleSwgcGFyYW1JbmRleCk7IH1cclxufVxyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIF9fbWV0YWRhdGEobWV0YWRhdGFLZXksIG1ldGFkYXRhVmFsdWUpIHtcclxuICAgIGlmICh0eXBlb2YgUmVmbGVjdCA9PT0gXCJvYmplY3RcIiAmJiB0eXBlb2YgUmVmbGVjdC5tZXRhZGF0YSA9PT0gXCJmdW5jdGlvblwiKSByZXR1cm4gUmVmbGVjdC5tZXRhZGF0YShtZXRhZGF0YUtleSwgbWV0YWRhdGFWYWx1ZSk7XHJcbn1cclxuXHJcbmV4cG9ydCBmdW5jdGlvbiBfX2F3YWl0ZXIodGhpc0FyZywgX2FyZ3VtZW50cywgUCwgZ2VuZXJhdG9yKSB7XHJcbiAgICBmdW5jdGlvbiBhZG9wdCh2YWx1ZSkgeyByZXR1cm4gdmFsdWUgaW5zdGFuY2VvZiBQID8gdmFsdWUgOiBuZXcgUChmdW5jdGlvbiAocmVzb2x2ZSkgeyByZXNvbHZlKHZhbHVlKTsgfSk7IH1cclxuICAgIHJldHVybiBuZXcgKFAgfHwgKFAgPSBQcm9taXNlKSkoZnVuY3Rpb24gKHJlc29sdmUsIHJlamVjdCkge1xyXG4gICAgICAgIGZ1bmN0aW9uIGZ1bGZpbGxlZCh2YWx1ZSkgeyB0cnkgeyBzdGVwKGdlbmVyYXRvci5uZXh0KHZhbHVlKSk7IH0gY2F0Y2ggKGUpIHsgcmVqZWN0KGUpOyB9IH1cclxuICAgICAgICBmdW5jdGlvbiByZWplY3RlZCh2YWx1ZSkgeyB0cnkgeyBzdGVwKGdlbmVyYXRvcltcInRocm93XCJdKHZhbHVlKSk7IH0gY2F0Y2ggKGUpIHsgcmVqZWN0KGUpOyB9IH1cclxuICAgICAgICBmdW5jdGlvbiBzdGVwKHJlc3VsdCkgeyByZXN1bHQuZG9uZSA/IHJlc29sdmUocmVzdWx0LnZhbHVlKSA6IGFkb3B0KHJlc3VsdC52YWx1ZSkudGhlbihmdWxmaWxsZWQsIHJlamVjdGVkKTsgfVxyXG4gICAgICAgIHN0ZXAoKGdlbmVyYXRvciA9IGdlbmVyYXRvci5hcHBseSh0aGlzQXJnLCBfYXJndW1lbnRzIHx8IFtdKSkubmV4dCgpKTtcclxuICAgIH0pO1xyXG59XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gX19nZW5lcmF0b3IodGhpc0FyZywgYm9keSkge1xyXG4gICAgdmFyIF8gPSB7IGxhYmVsOiAwLCBzZW50OiBmdW5jdGlvbigpIHsgaWYgKHRbMF0gJiAxKSB0aHJvdyB0WzFdOyByZXR1cm4gdFsxXTsgfSwgdHJ5czogW10sIG9wczogW10gfSwgZiwgeSwgdCwgZztcclxuICAgIHJldHVybiBnID0geyBuZXh0OiB2ZXJiKDApLCBcInRocm93XCI6IHZlcmIoMSksIFwicmV0dXJuXCI6IHZlcmIoMikgfSwgdHlwZW9mIFN5bWJvbCA9PT0gXCJmdW5jdGlvblwiICYmIChnW1N5bWJvbC5pdGVyYXRvcl0gPSBmdW5jdGlvbigpIHsgcmV0dXJuIHRoaXM7IH0pLCBnO1xyXG4gICAgZnVuY3Rpb24gdmVyYihuKSB7IHJldHVybiBmdW5jdGlvbiAodikgeyByZXR1cm4gc3RlcChbbiwgdl0pOyB9OyB9XHJcbiAgICBmdW5jdGlvbiBzdGVwKG9wKSB7XHJcbiAgICAgICAgaWYgKGYpIHRocm93IG5ldyBUeXBlRXJyb3IoXCJHZW5lcmF0b3IgaXMgYWxyZWFkeSBleGVjdXRpbmcuXCIpO1xyXG4gICAgICAgIHdoaWxlIChfKSB0cnkge1xyXG4gICAgICAgICAgICBpZiAoZiA9IDEsIHkgJiYgKHQgPSBvcFswXSAmIDIgPyB5W1wicmV0dXJuXCJdIDogb3BbMF0gPyB5W1widGhyb3dcIl0gfHwgKCh0ID0geVtcInJldHVyblwiXSkgJiYgdC5jYWxsKHkpLCAwKSA6IHkubmV4dCkgJiYgISh0ID0gdC5jYWxsKHksIG9wWzFdKSkuZG9uZSkgcmV0dXJuIHQ7XHJcbiAgICAgICAgICAgIGlmICh5ID0gMCwgdCkgb3AgPSBbb3BbMF0gJiAyLCB0LnZhbHVlXTtcclxuICAgICAgICAgICAgc3dpdGNoIChvcFswXSkge1xyXG4gICAgICAgICAgICAgICAgY2FzZSAwOiBjYXNlIDE6IHQgPSBvcDsgYnJlYWs7XHJcbiAgICAgICAgICAgICAgICBjYXNlIDQ6IF8ubGFiZWwrKzsgcmV0dXJuIHsgdmFsdWU6IG9wWzFdLCBkb25lOiBmYWxzZSB9O1xyXG4gICAgICAgICAgICAgICAgY2FzZSA1OiBfLmxhYmVsKys7IHkgPSBvcFsxXTsgb3AgPSBbMF07IGNvbnRpbnVlO1xyXG4gICAgICAgICAgICAgICAgY2FzZSA3OiBvcCA9IF8ub3BzLnBvcCgpOyBfLnRyeXMucG9wKCk7IGNvbnRpbnVlO1xyXG4gICAgICAgICAgICAgICAgZGVmYXVsdDpcclxuICAgICAgICAgICAgICAgICAgICBpZiAoISh0ID0gXy50cnlzLCB0ID0gdC5sZW5ndGggPiAwICYmIHRbdC5sZW5ndGggLSAxXSkgJiYgKG9wWzBdID09PSA2IHx8IG9wWzBdID09PSAyKSkgeyBfID0gMDsgY29udGludWU7IH1cclxuICAgICAgICAgICAgICAgICAgICBpZiAob3BbMF0gPT09IDMgJiYgKCF0IHx8IChvcFsxXSA+IHRbMF0gJiYgb3BbMV0gPCB0WzNdKSkpIHsgXy5sYWJlbCA9IG9wWzFdOyBicmVhazsgfVxyXG4gICAgICAgICAgICAgICAgICAgIGlmIChvcFswXSA9PT0gNiAmJiBfLmxhYmVsIDwgdFsxXSkgeyBfLmxhYmVsID0gdFsxXTsgdCA9IG9wOyBicmVhazsgfVxyXG4gICAgICAgICAgICAgICAgICAgIGlmICh0ICYmIF8ubGFiZWwgPCB0WzJdKSB7IF8ubGFiZWwgPSB0WzJdOyBfLm9wcy5wdXNoKG9wKTsgYnJlYWs7IH1cclxuICAgICAgICAgICAgICAgICAgICBpZiAodFsyXSkgXy5vcHMucG9wKCk7XHJcbiAgICAgICAgICAgICAgICAgICAgXy50cnlzLnBvcCgpOyBjb250aW51ZTtcclxuICAgICAgICAgICAgfVxyXG4gICAgICAgICAgICBvcCA9IGJvZHkuY2FsbCh0aGlzQXJnLCBfKTtcclxuICAgICAgICB9IGNhdGNoIChlKSB7IG9wID0gWzYsIGVdOyB5ID0gMDsgfSBmaW5hbGx5IHsgZiA9IHQgPSAwOyB9XHJcbiAgICAgICAgaWYgKG9wWzBdICYgNSkgdGhyb3cgb3BbMV07IHJldHVybiB7IHZhbHVlOiBvcFswXSA/IG9wWzFdIDogdm9pZCAwLCBkb25lOiB0cnVlIH07XHJcbiAgICB9XHJcbn1cclxuXHJcbmV4cG9ydCB2YXIgX19jcmVhdGVCaW5kaW5nID0gT2JqZWN0LmNyZWF0ZSA/IChmdW5jdGlvbihvLCBtLCBrLCBrMikge1xyXG4gICAgaWYgKGsyID09PSB1bmRlZmluZWQpIGsyID0gaztcclxuICAgIE9iamVjdC5kZWZpbmVQcm9wZXJ0eShvLCBrMiwgeyBlbnVtZXJhYmxlOiB0cnVlLCBnZXQ6IGZ1bmN0aW9uKCkgeyByZXR1cm4gbVtrXTsgfSB9KTtcclxufSkgOiAoZnVuY3Rpb24obywgbSwgaywgazIpIHtcclxuICAgIGlmIChrMiA9PT0gdW5kZWZpbmVkKSBrMiA9IGs7XHJcbiAgICBvW2syXSA9IG1ba107XHJcbn0pO1xyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIF9fZXhwb3J0U3RhcihtLCBvKSB7XHJcbiAgICBmb3IgKHZhciBwIGluIG0pIGlmIChwICE9PSBcImRlZmF1bHRcIiAmJiAhT2JqZWN0LnByb3RvdHlwZS5oYXNPd25Qcm9wZXJ0eS5jYWxsKG8sIHApKSBfX2NyZWF0ZUJpbmRpbmcobywgbSwgcCk7XHJcbn1cclxuXHJcbmV4cG9ydCBmdW5jdGlvbiBfX3ZhbHVlcyhvKSB7XHJcbiAgICB2YXIgcyA9IHR5cGVvZiBTeW1ib2wgPT09IFwiZnVuY3Rpb25cIiAmJiBTeW1ib2wuaXRlcmF0b3IsIG0gPSBzICYmIG9bc10sIGkgPSAwO1xyXG4gICAgaWYgKG0pIHJldHVybiBtLmNhbGwobyk7XHJcbiAgICBpZiAobyAmJiB0eXBlb2Ygby5sZW5ndGggPT09IFwibnVtYmVyXCIpIHJldHVybiB7XHJcbiAgICAgICAgbmV4dDogZnVuY3Rpb24gKCkge1xyXG4gICAgICAgICAgICBpZiAobyAmJiBpID49IG8ubGVuZ3RoKSBvID0gdm9pZCAwO1xyXG4gICAgICAgICAgICByZXR1cm4geyB2YWx1ZTogbyAmJiBvW2krK10sIGRvbmU6ICFvIH07XHJcbiAgICAgICAgfVxyXG4gICAgfTtcclxuICAgIHRocm93IG5ldyBUeXBlRXJyb3IocyA/IFwiT2JqZWN0IGlzIG5vdCBpdGVyYWJsZS5cIiA6IFwiU3ltYm9sLml0ZXJhdG9yIGlzIG5vdCBkZWZpbmVkLlwiKTtcclxufVxyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIF9fcmVhZChvLCBuKSB7XHJcbiAgICB2YXIgbSA9IHR5cGVvZiBTeW1ib2wgPT09IFwiZnVuY3Rpb25cIiAmJiBvW1N5bWJvbC5pdGVyYXRvcl07XHJcbiAgICBpZiAoIW0pIHJldHVybiBvO1xyXG4gICAgdmFyIGkgPSBtLmNhbGwobyksIHIsIGFyID0gW10sIGU7XHJcbiAgICB0cnkge1xyXG4gICAgICAgIHdoaWxlICgobiA9PT0gdm9pZCAwIHx8IG4tLSA+IDApICYmICEociA9IGkubmV4dCgpKS5kb25lKSBhci5wdXNoKHIudmFsdWUpO1xyXG4gICAgfVxyXG4gICAgY2F0Y2ggKGVycm9yKSB7IGUgPSB7IGVycm9yOiBlcnJvciB9OyB9XHJcbiAgICBmaW5hbGx5IHtcclxuICAgICAgICB0cnkge1xyXG4gICAgICAgICAgICBpZiAociAmJiAhci5kb25lICYmIChtID0gaVtcInJldHVyblwiXSkpIG0uY2FsbChpKTtcclxuICAgICAgICB9XHJcbiAgICAgICAgZmluYWxseSB7IGlmIChlKSB0aHJvdyBlLmVycm9yOyB9XHJcbiAgICB9XHJcbiAgICByZXR1cm4gYXI7XHJcbn1cclxuXHJcbi8qKiBAZGVwcmVjYXRlZCAqL1xyXG5leHBvcnQgZnVuY3Rpb24gX19zcHJlYWQoKSB7XHJcbiAgICBmb3IgKHZhciBhciA9IFtdLCBpID0gMDsgaSA8IGFyZ3VtZW50cy5sZW5ndGg7IGkrKylcclxuICAgICAgICBhciA9IGFyLmNvbmNhdChfX3JlYWQoYXJndW1lbnRzW2ldKSk7XHJcbiAgICByZXR1cm4gYXI7XHJcbn1cclxuXHJcbi8qKiBAZGVwcmVjYXRlZCAqL1xyXG5leHBvcnQgZnVuY3Rpb24gX19zcHJlYWRBcnJheXMoKSB7XHJcbiAgICBmb3IgKHZhciBzID0gMCwgaSA9IDAsIGlsID0gYXJndW1lbnRzLmxlbmd0aDsgaSA8IGlsOyBpKyspIHMgKz0gYXJndW1lbnRzW2ldLmxlbmd0aDtcclxuICAgIGZvciAodmFyIHIgPSBBcnJheShzKSwgayA9IDAsIGkgPSAwOyBpIDwgaWw7IGkrKylcclxuICAgICAgICBmb3IgKHZhciBhID0gYXJndW1lbnRzW2ldLCBqID0gMCwgamwgPSBhLmxlbmd0aDsgaiA8IGpsOyBqKyssIGsrKylcclxuICAgICAgICAgICAgcltrXSA9IGFbal07XHJcbiAgICByZXR1cm4gcjtcclxufVxyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIF9fc3ByZWFkQXJyYXkodG8sIGZyb20pIHtcclxuICAgIGZvciAodmFyIGkgPSAwLCBpbCA9IGZyb20ubGVuZ3RoLCBqID0gdG8ubGVuZ3RoOyBpIDwgaWw7IGkrKywgaisrKVxyXG4gICAgICAgIHRvW2pdID0gZnJvbVtpXTtcclxuICAgIHJldHVybiB0bztcclxufVxyXG5cclxuZXhwb3J0IGZ1bmN0aW9uIF9fYXdhaXQodikge1xyXG4gICAgcmV0dXJuIHRoaXMgaW5zdGFuY2VvZiBfX2F3YWl0ID8gKHRoaXMudiA9IHYsIHRoaXMpIDogbmV3IF9fYXdhaXQodik7XHJcbn1cclxuXHJcbmV4cG9ydCBmdW5jdGlvbiBfX2FzeW5jR2VuZXJhdG9yKHRoaXNBcmcsIF9hcmd1bWVudHMsIGdlbmVyYXRvcikge1xyXG4gICAgaWYgKCFTeW1ib2wuYXN5bmNJdGVyYXRvcikgdGhyb3cgbmV3IFR5cGVFcnJvcihcIlN5bWJvbC5hc3luY0l0ZXJhdG9yIGlzIG5vdCBkZWZpbmVkLlwiKTtcclxuICAgIHZhciBnID0gZ2VuZXJhdG9yLmFwcGx5KHRoaXNBcmcsIF9hcmd1bWVudHMgfHwgW10pLCBpLCBxID0gW107XHJcbiAgICByZXR1cm4gaSA9IHt9LCB2ZXJiKFwibmV4dFwiKSwgdmVyYihcInRocm93XCIpLCB2ZXJiKFwicmV0dXJuXCIpLCBpW1N5bWJvbC5hc3luY0l0ZXJhdG9yXSA9IGZ1bmN0aW9uICgpIHsgcmV0dXJuIHRoaXM7IH0sIGk7XHJcbiAgICBmdW5jdGlvbiB2ZXJiKG4pIHsgaWYgKGdbbl0pIGlbbl0gPSBmdW5jdGlvbiAodikgeyByZXR1cm4gbmV3IFByb21pc2UoZnVuY3Rpb24gKGEsIGIpIHsgcS5wdXNoKFtuLCB2LCBhLCBiXSkgPiAxIHx8IHJlc3VtZShuLCB2KTsgfSk7IH07IH1cclxuICAgIGZ1bmN0aW9uIHJlc3VtZShuLCB2KSB7IHRyeSB7IHN0ZXAoZ1tuXSh2KSk7IH0gY2F0Y2ggKGUpIHsgc2V0dGxlKHFbMF1bM10sIGUpOyB9IH1cclxuICAgIGZ1bmN0aW9uIHN0ZXAocikgeyByLnZhbHVlIGluc3RhbmNlb2YgX19hd2FpdCA/IFByb21pc2UucmVzb2x2ZShyLnZhbHVlLnYpLnRoZW4oZnVsZmlsbCwgcmVqZWN0KSA6IHNldHRsZShxWzBdWzJdLCByKTsgfVxyXG4gICAgZnVuY3Rpb24gZnVsZmlsbCh2YWx1ZSkgeyByZXN1bWUoXCJuZXh0XCIsIHZhbHVlKTsgfVxyXG4gICAgZnVuY3Rpb24gcmVqZWN0KHZhbHVlKSB7IHJlc3VtZShcInRocm93XCIsIHZhbHVlKTsgfVxyXG4gICAgZnVuY3Rpb24gc2V0dGxlKGYsIHYpIHsgaWYgKGYodiksIHEuc2hpZnQoKSwgcS5sZW5ndGgpIHJlc3VtZShxWzBdWzBdLCBxWzBdWzFdKTsgfVxyXG59XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gX19hc3luY0RlbGVnYXRvcihvKSB7XHJcbiAgICB2YXIgaSwgcDtcclxuICAgIHJldHVybiBpID0ge30sIHZlcmIoXCJuZXh0XCIpLCB2ZXJiKFwidGhyb3dcIiwgZnVuY3Rpb24gKGUpIHsgdGhyb3cgZTsgfSksIHZlcmIoXCJyZXR1cm5cIiksIGlbU3ltYm9sLml0ZXJhdG9yXSA9IGZ1bmN0aW9uICgpIHsgcmV0dXJuIHRoaXM7IH0sIGk7XHJcbiAgICBmdW5jdGlvbiB2ZXJiKG4sIGYpIHsgaVtuXSA9IG9bbl0gPyBmdW5jdGlvbiAodikgeyByZXR1cm4gKHAgPSAhcCkgPyB7IHZhbHVlOiBfX2F3YWl0KG9bbl0odikpLCBkb25lOiBuID09PSBcInJldHVyblwiIH0gOiBmID8gZih2KSA6IHY7IH0gOiBmOyB9XHJcbn1cclxuXHJcbmV4cG9ydCBmdW5jdGlvbiBfX2FzeW5jVmFsdWVzKG8pIHtcclxuICAgIGlmICghU3ltYm9sLmFzeW5jSXRlcmF0b3IpIHRocm93IG5ldyBUeXBlRXJyb3IoXCJTeW1ib2wuYXN5bmNJdGVyYXRvciBpcyBub3QgZGVmaW5lZC5cIik7XHJcbiAgICB2YXIgbSA9IG9bU3ltYm9sLmFzeW5jSXRlcmF0b3JdLCBpO1xyXG4gICAgcmV0dXJuIG0gPyBtLmNhbGwobykgOiAobyA9IHR5cGVvZiBfX3ZhbHVlcyA9PT0gXCJmdW5jdGlvblwiID8gX192YWx1ZXMobykgOiBvW1N5bWJvbC5pdGVyYXRvcl0oKSwgaSA9IHt9LCB2ZXJiKFwibmV4dFwiKSwgdmVyYihcInRocm93XCIpLCB2ZXJiKFwicmV0dXJuXCIpLCBpW1N5bWJvbC5hc3luY0l0ZXJhdG9yXSA9IGZ1bmN0aW9uICgpIHsgcmV0dXJuIHRoaXM7IH0sIGkpO1xyXG4gICAgZnVuY3Rpb24gdmVyYihuKSB7IGlbbl0gPSBvW25dICYmIGZ1bmN0aW9uICh2KSB7IHJldHVybiBuZXcgUHJvbWlzZShmdW5jdGlvbiAocmVzb2x2ZSwgcmVqZWN0KSB7IHYgPSBvW25dKHYpLCBzZXR0bGUocmVzb2x2ZSwgcmVqZWN0LCB2LmRvbmUsIHYudmFsdWUpOyB9KTsgfTsgfVxyXG4gICAgZnVuY3Rpb24gc2V0dGxlKHJlc29sdmUsIHJlamVjdCwgZCwgdikgeyBQcm9taXNlLnJlc29sdmUodikudGhlbihmdW5jdGlvbih2KSB7IHJlc29sdmUoeyB2YWx1ZTogdiwgZG9uZTogZCB9KTsgfSwgcmVqZWN0KTsgfVxyXG59XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gX19tYWtlVGVtcGxhdGVPYmplY3QoY29va2VkLCByYXcpIHtcclxuICAgIGlmIChPYmplY3QuZGVmaW5lUHJvcGVydHkpIHsgT2JqZWN0LmRlZmluZVByb3BlcnR5KGNvb2tlZCwgXCJyYXdcIiwgeyB2YWx1ZTogcmF3IH0pOyB9IGVsc2UgeyBjb29rZWQucmF3ID0gcmF3OyB9XHJcbiAgICByZXR1cm4gY29va2VkO1xyXG59O1xyXG5cclxudmFyIF9fc2V0TW9kdWxlRGVmYXVsdCA9IE9iamVjdC5jcmVhdGUgPyAoZnVuY3Rpb24obywgdikge1xyXG4gICAgT2JqZWN0LmRlZmluZVByb3BlcnR5KG8sIFwiZGVmYXVsdFwiLCB7IGVudW1lcmFibGU6IHRydWUsIHZhbHVlOiB2IH0pO1xyXG59KSA6IGZ1bmN0aW9uKG8sIHYpIHtcclxuICAgIG9bXCJkZWZhdWx0XCJdID0gdjtcclxufTtcclxuXHJcbmV4cG9ydCBmdW5jdGlvbiBfX2ltcG9ydFN0YXIobW9kKSB7XHJcbiAgICBpZiAobW9kICYmIG1vZC5fX2VzTW9kdWxlKSByZXR1cm4gbW9kO1xyXG4gICAgdmFyIHJlc3VsdCA9IHt9O1xyXG4gICAgaWYgKG1vZCAhPSBudWxsKSBmb3IgKHZhciBrIGluIG1vZCkgaWYgKGsgIT09IFwiZGVmYXVsdFwiICYmIE9iamVjdC5wcm90b3R5cGUuaGFzT3duUHJvcGVydHkuY2FsbChtb2QsIGspKSBfX2NyZWF0ZUJpbmRpbmcocmVzdWx0LCBtb2QsIGspO1xyXG4gICAgX19zZXRNb2R1bGVEZWZhdWx0KHJlc3VsdCwgbW9kKTtcclxuICAgIHJldHVybiByZXN1bHQ7XHJcbn1cclxuXHJcbmV4cG9ydCBmdW5jdGlvbiBfX2ltcG9ydERlZmF1bHQobW9kKSB7XHJcbiAgICByZXR1cm4gKG1vZCAmJiBtb2QuX19lc01vZHVsZSkgPyBtb2QgOiB7IGRlZmF1bHQ6IG1vZCB9O1xyXG59XHJcblxyXG5leHBvcnQgZnVuY3Rpb24gX19jbGFzc1ByaXZhdGVGaWVsZEdldChyZWNlaXZlciwgcHJpdmF0ZU1hcCkge1xyXG4gICAgaWYgKCFwcml2YXRlTWFwLmhhcyhyZWNlaXZlcikpIHtcclxuICAgICAgICB0aHJvdyBuZXcgVHlwZUVycm9yKFwiYXR0ZW1wdGVkIHRvIGdldCBwcml2YXRlIGZpZWxkIG9uIG5vbi1pbnN0YW5jZVwiKTtcclxuICAgIH1cclxuICAgIHJldHVybiBwcml2YXRlTWFwLmdldChyZWNlaXZlcik7XHJcbn1cclxuXHJcbmV4cG9ydCBmdW5jdGlvbiBfX2NsYXNzUHJpdmF0ZUZpZWxkU2V0KHJlY2VpdmVyLCBwcml2YXRlTWFwLCB2YWx1ZSkge1xyXG4gICAgaWYgKCFwcml2YXRlTWFwLmhhcyhyZWNlaXZlcikpIHtcclxuICAgICAgICB0aHJvdyBuZXcgVHlwZUVycm9yKFwiYXR0ZW1wdGVkIHRvIHNldCBwcml2YXRlIGZpZWxkIG9uIG5vbi1pbnN0YW5jZVwiKTtcclxuICAgIH1cclxuICAgIHByaXZhdGVNYXAuc2V0KHJlY2VpdmVyLCB2YWx1ZSk7XHJcbiAgICByZXR1cm4gdmFsdWU7XHJcbn1cclxuIiwiaW1wb3J0IHsgQXBwLCBnZXRBbGxUYWdzLCBnZXRMaW5rcGF0aCwgaXRlcmF0ZUNhY2hlUmVmcywgTW9kYWwsIG5vcm1hbGl6ZVBhdGgsIFBsdWdpbiwgUGx1Z2luU2V0dGluZ1RhYiwgU2V0dGluZywgVEZpbGUgfSBmcm9tICdvYnNpZGlhbic7XHJcblxyXG5pbnRlcmZhY2UgU2V0dGluZ3Mge1xyXG5cdG91dHB1dEZpbGVOYW1lOiBzdHJpbmc7XHJcblx0ZGlzYWJsZVdvcmtpbmdMaW5rczogYm9vbGVhbjtcclxuXHRkaXJlY3Rvcmllc1RvSWdub3JlOiBzdHJpbmdbXTtcclxuXHRmaWxlc1RvSWdub3JlOiBzdHJpbmdbXTtcclxuXHRmaWxlVHlwZXNUb0lnbm9yZTogc3RyaW5nW107XHJcblx0bGlua3NUb0lnbm9yZTogc3RyaW5nW107XHJcblx0dGFnc1RvSWdub3JlOiBzdHJpbmdbXTtcclxuXHRmaWxlVHlwZXNUb0RlbGV0ZTogc3RyaW5nW107XHJcbn1cclxuY29uc3QgREVGQVVMVF9TRVRUSU5HUzogU2V0dGluZ3MgPSB7XHJcblx0b3V0cHV0RmlsZU5hbWU6IFwiRmluZCB1bmxpbmtlZCBmaWxlcyBwbHVnaW4gb3V0cHV0XCIsXHJcblx0ZGlzYWJsZVdvcmtpbmdMaW5rczogZmFsc2UsXHJcblx0ZGlyZWN0b3JpZXNUb0lnbm9yZTogW10sXHJcblx0ZmlsZXNUb0lnbm9yZTogW10sXHJcblx0ZmlsZVR5cGVzVG9JZ25vcmU6IFtdLFxyXG5cdGxpbmtzVG9JZ25vcmU6IFtdLFxyXG5cdHRhZ3NUb0lnbm9yZTogW10sXHJcblx0ZmlsZVR5cGVzVG9EZWxldGU6IFtdLFxyXG59O1xyXG5leHBvcnQgZGVmYXVsdCBjbGFzcyBGaW5kVW5saW5rZWRGaWxlc1BsdWdpbiBleHRlbmRzIFBsdWdpbiB7XHJcblx0c2V0dGluZ3M6IFNldHRpbmdzO1xyXG5cdGFzeW5jIG9ubG9hZCgpIHtcclxuXHRcdGNvbnNvbGUubG9nKCdsb2FkaW5nICcgKyB0aGlzLm1hbmlmZXN0Lm5hbWUgKyBcIiBwbHVnaW5cIik7XHJcblx0XHRhd2FpdCB0aGlzLmxvYWRTZXR0aW5ncygpO1xyXG5cdFx0dGhpcy5hZGRDb21tYW5kKHtcclxuXHRcdFx0aWQ6ICdmaW5kLXVubGlua2VkLWZpbGVzJyxcclxuXHRcdFx0bmFtZTogJ0ZpbmQgdW5saW5rZWQgZmlsZXMnLFxyXG5cdFx0XHRjYWxsYmFjazogYXN5bmMgKCkgPT4ge1xyXG5cdFx0XHRcdGxldCBvdXRGaWxlID0gdGhpcy5zZXR0aW5ncy5vdXRwdXRGaWxlTmFtZSArIFwiLm1kXCI7XHJcblx0XHRcdFx0bGV0IGZpbGVzID0gdGhpcy5hcHAudmF1bHQuZ2V0RmlsZXMoKTtcclxuXHRcdFx0XHRsZXQgbWFya2Rvd25GaWxlcyA9IHRoaXMuYXBwLnZhdWx0LmdldE1hcmtkb3duRmlsZXMoKTtcclxuXHRcdFx0XHRsZXQgbGlua3M6IFN0cmluZ1tdID0gW107XHJcblxyXG5cdFx0XHRcdG1hcmtkb3duRmlsZXMuZm9yRWFjaCgobWFya0ZpbGU6IFRGaWxlKSA9PiB7XHJcblx0XHRcdFx0XHRpZiAobWFya0ZpbGUucGF0aCA9PSBvdXRGaWxlKVxyXG5cdFx0XHRcdFx0XHRyZXR1cm47XHJcblx0XHRcdFx0XHRpdGVyYXRlQ2FjaGVSZWZzKHRoaXMuYXBwLm1ldGFkYXRhQ2FjaGUuZ2V0RmlsZUNhY2hlKG1hcmtGaWxlKSwgY2IgPT4ge1xyXG5cdFx0XHRcdFx0XHRsZXQgdHh0ID0gdGhpcy5hcHAubWV0YWRhdGFDYWNoZS5nZXRGaXJzdExpbmtwYXRoRGVzdChnZXRMaW5rcGF0aChjYi5saW5rKSwgbWFya0ZpbGUucGF0aCk7XHJcblx0XHRcdFx0XHRcdGlmICh0eHQgIT0gbnVsbClcclxuXHRcdFx0XHRcdFx0XHRsaW5rcy5wdXNoKHR4dC5wYXRoKTtcclxuXHRcdFx0XHRcdH0pO1xyXG5cdFx0XHRcdH0pO1xyXG5cclxuXHRcdFx0XHRsZXQgbm90TGlua2VkRmlsZXM6IFRGaWxlW10gPSBbXTtcclxuXHJcblx0XHRcdFx0ZmlsZXMuZm9yRWFjaCgoZmlsZTogVEZpbGUpID0+IHtcclxuXHRcdFx0XHRcdGlmIChmaWxlLnBhdGggPT0gb3V0RmlsZSlcclxuXHRcdFx0XHRcdFx0cmV0dXJuO1xyXG5cclxuXHRcdFx0XHRcdC8vZmlsZXR5cGVzIHRvIGlnbm9yZSBieSBkZWZhdWx0XHJcblx0XHRcdFx0XHRpZiAoW1wiY3NzXCJdLmNvbnRhaW5zKGZpbGUuZXh0ZW5zaW9uKSlcclxuXHRcdFx0XHRcdFx0cmV0dXJuO1xyXG5cdFx0XHRcdFx0aWYgKHRoaXMuc2V0dGluZ3MuZmlsZVR5cGVzVG9JZ25vcmUuY29udGFpbnMoZmlsZS5leHRlbnNpb24pKVxyXG5cdFx0XHRcdFx0XHRyZXR1cm47XHJcblxyXG5cdFx0XHRcdFx0aWYgKHRoaXMuZmluZExpbmtzVG9JZ25vcmUoZmlsZSkpXHJcblx0XHRcdFx0XHRcdHJldHVybjtcclxuXHRcdFx0XHRcdGlmICh0aGlzLmZpbmRUYWdzVG9JZ25vcmUoZmlsZSkpXHJcblx0XHRcdFx0XHRcdHJldHVybjtcclxuXHRcdFx0XHRcdGlmICh0aGlzLmZpbmREaXJlY3RvcnlUb0lnbm9yZShmaWxlKSlcclxuXHRcdFx0XHRcdFx0cmV0dXJuO1xyXG5cclxuXHJcblx0XHRcdFx0XHRpZiAodGhpcy5zZXR0aW5ncy5maWxlc1RvSWdub3JlLmNvbnRhaW5zKGZpbGUucGF0aCkpXHJcblx0XHRcdFx0XHRcdHJldHVybjtcclxuXHRcdFx0XHRcdGlmIChsaW5rcy5jb250YWlucyhmaWxlLnBhdGgpKVxyXG5cdFx0XHRcdFx0XHRyZXR1cm47XHJcblx0XHRcdFx0XHRub3RMaW5rZWRGaWxlcy5wdXNoKGZpbGUpO1xyXG5cdFx0XHRcdH0pO1xyXG5cdFx0XHRcdGxldCB0ZXh0ID0gXCJcIjtcclxuXHRcdFx0XHRsZXQgcHJlZml4OiBzdHJpbmc7XHJcblx0XHRcdFx0aWYgKHRoaXMuc2V0dGluZ3MuZGlzYWJsZVdvcmtpbmdMaW5rcylcclxuXHRcdFx0XHRcdHByZWZpeCA9IFwiXHRcIjtcclxuXHRcdFx0XHRlbHNlXHJcblx0XHRcdFx0XHRwcmVmaXggPSBcIlwiO1xyXG5cdFx0XHRcdG5vdExpbmtlZEZpbGVzLmZvckVhY2goKGZpbGUpID0+IHtcclxuXHRcdFx0XHRcdHRleHQgKz0gcHJlZml4ICsgXCItIFtbXCIgKyB0aGlzLmFwcC5tZXRhZGF0YUNhY2hlLmZpbGVUb0xpbmt0ZXh0KGZpbGUsIFwiL1wiKSArIFwiXV1cXG5cIjtcclxuXHRcdFx0XHR9KTtcclxuXHRcdFx0XHRhd2FpdCB0aGlzLmFwcC52YXVsdC5hZGFwdGVyLndyaXRlKG91dEZpbGUsIHRleHQpO1xyXG5cclxuXHRcdFx0XHRsZXQgZmlsZUlzQWxyZWFkeU9wZW5lZCA9IGZhbHNlO1xyXG5cclxuXHRcdFx0XHR0aGlzLmFwcC53b3Jrc3BhY2UuaXRlcmF0ZUFsbExlYXZlcyhsZWFmID0+IHtcclxuXHRcdFx0XHRcdGlmIChvdXRGaWxlLnN0YXJ0c1dpdGgobGVhZi5nZXREaXNwbGF5VGV4dCgpKSkge1xyXG5cdFx0XHRcdFx0XHRmaWxlSXNBbHJlYWR5T3BlbmVkID0gdHJ1ZTtcclxuXHRcdFx0XHRcdH1cclxuXHRcdFx0XHR9KTtcclxuXHRcdFx0XHRpZiAoIWZpbGVJc0FscmVhZHlPcGVuZWQpXHJcblx0XHRcdFx0XHR0aGlzLmFwcC53b3Jrc3BhY2Uub3BlbkxpbmtUZXh0KG91dEZpbGUsIFwiL1wiLCB0cnVlKTtcclxuXHRcdFx0fSxcclxuXHRcdH0pO1xyXG5cdFx0dGhpcy5hZGRDb21tYW5kKHtcclxuXHRcdFx0aWQ6IFwiZGVsZXRlLXVubGlua2VkLWZpbGVzXCIsXHJcblx0XHRcdG5hbWU6IFwiRGVsZXRlIHVubGlua2VkIGZpbGVzIHdpdGggY2VydGFpbiBleHRlbnNpb24uIFNlZSBSRUFETUVcIixcclxuXHRcdFx0Y2FsbGJhY2s6ICgpID0+IHtcclxuXHRcdFx0XHRjb25zdCBsaW5rcyA9IHRoaXMuYXBwLm1ldGFkYXRhQ2FjaGUuZ2V0Q2FjaGUodGhpcy5zZXR0aW5ncy5vdXRwdXRGaWxlTmFtZSArIFwiLm1kXCIpPy5saW5rcyA/PyBbXTtcclxuXHRcdFx0XHRjb25zdCBmaWxlc1RvRGVsZXRlOiBURmlsZVtdID0gW107XHJcblx0XHRcdFx0bGlua3MuZm9yRWFjaCgobGluaykgPT4ge1xyXG5cdFx0XHRcdFx0Y29uc3QgZmlsZSA9IHRoaXMuYXBwLm1ldGFkYXRhQ2FjaGUuZ2V0Rmlyc3RMaW5rcGF0aERlc3QobGluay5saW5rLCBcIi9cIik7XHJcblx0XHRcdFx0XHRpZiAoIWZpbGUpXHJcblx0XHRcdFx0XHRcdHJldHVybjtcclxuXHRcdFx0XHRcdGlmICh0aGlzLnNldHRpbmdzLmZpbGVUeXBlc1RvRGVsZXRlLmNvbnRhaW5zKGZpbGUuZXh0ZW5zaW9uKSkge1xyXG5cdFx0XHRcdFx0XHRmaWxlc1RvRGVsZXRlLnB1c2goZmlsZSk7XHJcblx0XHRcdFx0XHR9XHJcblx0XHRcdFx0fSk7XHJcblx0XHRcdFx0aWYgKGZpbGVzVG9EZWxldGUubGVuZ3RoID4gMClcclxuXHRcdFx0XHRcdG5ldyBEZWxldGVGaWxlc01vZGFsKHRoaXMuYXBwLCBmaWxlc1RvRGVsZXRlKS5vcGVuKCk7XHJcblx0XHRcdH1cclxuXHRcdH0pO1xyXG5cdFx0dGhpcy5hZGRTZXR0aW5nVGFiKG5ldyBTZXR0aW5nc1RhYih0aGlzLmFwcCwgdGhpcykpO1xyXG5cdH1cclxuXHJcblx0ZmluZERpcmVjdG9yeVRvSWdub3JlKGZpbGU6IFRGaWxlKTogYm9vbGVhbiB7XHJcblx0XHRsZXQgZm91bmQgPSBmYWxzZTtcclxuXHRcdHRoaXMuc2V0dGluZ3MuZGlyZWN0b3JpZXNUb0lnbm9yZS5mb3JFYWNoKHZhbHVlID0+IHtcclxuXHRcdFx0aWYgKGZpbGUucGF0aC5zdGFydHNXaXRoKHZhbHVlKSAmJiB2YWx1ZS5sZW5ndGggIT0gMClcclxuXHRcdFx0XHRmb3VuZCA9IHRydWU7XHJcblx0XHR9KTtcclxuXHRcdHJldHVybiBmb3VuZDtcclxuXHR9XHJcblx0ZmluZExpbmtzVG9JZ25vcmUoZmlsZTogVEZpbGUpOiBib29sZWFuIHtcclxuXHRcdGxldCBmb3VuZCA9IGZhbHNlO1xyXG5cdFx0aXRlcmF0ZUNhY2hlUmVmcyh0aGlzLmFwcC5tZXRhZGF0YUNhY2hlLmdldEZpbGVDYWNoZShmaWxlKSwgY2IgPT4ge1xyXG5cdFx0XHRsZXQgbGluayA9IHRoaXMuYXBwLm1ldGFkYXRhQ2FjaGUuZ2V0Rmlyc3RMaW5rcGF0aERlc3QoY2IubGluaywgZmlsZS5wYXRoKT8ucGF0aDtcclxuXHRcdFx0aWYgKCFsaW5rKVxyXG5cdFx0XHRcdHJldHVybjtcclxuXHRcdFx0aWYgKHRoaXMuc2V0dGluZ3MubGlua3NUb0lnbm9yZS5jb250YWlucyhsaW5rKSlcclxuXHRcdFx0XHRmb3VuZCA9IHRydWU7XHJcblx0XHR9KTtcclxuXHRcdHJldHVybiBmb3VuZDtcclxuXHR9XHJcblx0ZmluZFRhZ3NUb0lnbm9yZShmaWxlOiBURmlsZSk6IGJvb2xlYW4ge1xyXG5cdFx0bGV0IGZvdW5kID0gZmFsc2U7XHJcblx0XHRsZXQgdGFncyA9IGdldEFsbFRhZ3ModGhpcy5hcHAubWV0YWRhdGFDYWNoZS5nZXRGaWxlQ2FjaGUoZmlsZSkpO1xyXG5cclxuXHRcdGlmICh0YWdzKSB7XHJcblx0XHRcdHRhZ3MuZm9yRWFjaCh0YWcgPT4ge1xyXG5cdFx0XHRcdGlmICh0aGlzLnNldHRpbmdzLnRhZ3NUb0lnbm9yZS5jb250YWlucyh0YWcuc3Vic3RyaW5nKDEpKSlcclxuXHRcdFx0XHRcdGZvdW5kID0gdHJ1ZTtcclxuXHRcdFx0fSk7XHJcblx0XHRcdHJldHVybiBmb3VuZDtcclxuXHRcdH1cclxuXHRcdGVsc2Uge1xyXG5cdFx0XHRyZXR1cm4gZmFsc2U7XHJcblx0XHR9XHJcblx0fVxyXG5cclxuXHJcblx0b251bmxvYWQoKSB7XHJcblx0XHRjb25zb2xlLmxvZygndW5sb2FkaW5nICcgKyB0aGlzLm1hbmlmZXN0Lm5hbWUgKyBcIiBwbHVnaW5cIik7XHJcblx0fVxyXG5cdGFzeW5jIGxvYWRTZXR0aW5ncygpIHtcclxuXHRcdHRoaXMuc2V0dGluZ3MgPSBPYmplY3QuYXNzaWduKERFRkFVTFRfU0VUVElOR1MsIGF3YWl0IHRoaXMubG9hZERhdGEoKSk7XHJcblx0fVxyXG5cclxuXHRhc3luYyBzYXZlU2V0dGluZ3MoKSB7XHJcblx0XHRhd2FpdCB0aGlzLnNhdmVEYXRhKHRoaXMuc2V0dGluZ3MpO1xyXG5cdH1cclxuXHJcbn1cclxuY2xhc3MgRGVsZXRlRmlsZXNNb2RhbCBleHRlbmRzIE1vZGFsIHtcclxuXHRmaWxlc1RvRGVsZXRlOiBURmlsZVtdO1xyXG5cdGNvbnN0cnVjdG9yKGFwcDogQXBwLCBmaWxlc1RvRGVsZXRlOiBURmlsZVtdKSB7XHJcblx0XHRzdXBlcihhcHApO1xyXG5cdFx0dGhpcy5maWxlc1RvRGVsZXRlID0gZmlsZXNUb0RlbGV0ZTtcclxuXHR9XHJcblxyXG5cdG9uT3BlbigpIHtcclxuXHRcdGxldCB7IGNvbnRlbnRFbCwgdGl0bGVFbCB9ID0gdGhpcztcclxuXHRcdHRpdGxlRWwuc2V0VGV4dCgnTW92ZSAnICsgdGhpcy5maWxlc1RvRGVsZXRlLmxlbmd0aCArICcgZmlsZXMgdG8gc3lzdGVtIHRyYXNoPycpO1xyXG5cdFx0Y29udGVudEVsXHJcblx0XHRcdC5jcmVhdGVFbChcImJ1dHRvblwiLCB7IHRleHQ6IFwiQ2FuY2VsXCIgfSlcclxuXHRcdFx0LmFkZEV2ZW50TGlzdGVuZXIoXCJjbGlja1wiLCAoKSA9PiB0aGlzLmNsb3NlKCkpO1xyXG5cdFx0Y29udGVudEVsXHJcblx0XHRcdC5zZXRBdHRyKFwibWFyZ2luXCIsIFwiYXV0b1wiKTtcclxuXHJcblx0XHRjb250ZW50RWxcclxuXHRcdFx0LmNyZWF0ZUVsKFwiYnV0dG9uXCIsXHJcblx0XHRcdFx0e1xyXG5cdFx0XHRcdFx0Y2xzOiBcIm1vZC1jdGFcIixcclxuXHRcdFx0XHRcdHRleHQ6IFwiQ29uZmlybVwiXHJcblx0XHRcdFx0fSlcclxuXHRcdFx0LmFkZEV2ZW50TGlzdGVuZXIoXCJjbGlja1wiLCBhc3luYyAoKSA9PiB7XHJcblx0XHRcdFx0Zm9yIChjb25zdCBmaWxlIG9mIHRoaXMuZmlsZXNUb0RlbGV0ZSkge1xyXG5cdFx0XHRcdFx0YXdhaXQgdGhpcy5hcHAudmF1bHQudHJhc2goZmlsZSwgdHJ1ZSk7XHJcblx0XHRcdFx0fVxyXG5cdFx0XHRcdHRoaXMuY2xvc2UoKTtcclxuXHRcdFx0fSk7XHJcblxyXG5cdH1cclxuXHJcblx0b25DbG9zZSgpIHtcclxuXHRcdGxldCB7IGNvbnRlbnRFbCB9ID0gdGhpcztcclxuXHRcdGNvbnRlbnRFbC5lbXB0eSgpO1xyXG5cdH1cclxufVxyXG5cclxuY2xhc3MgU2V0dGluZ3NUYWIgZXh0ZW5kcyBQbHVnaW5TZXR0aW5nVGFiIHtcclxuXHRwbHVnaW46IEZpbmRVbmxpbmtlZEZpbGVzUGx1Z2luO1xyXG5cdGNvbnN0cnVjdG9yKGFwcDogQXBwLCBwbHVnaW46IEZpbmRVbmxpbmtlZEZpbGVzUGx1Z2luKSB7XHJcblx0XHRzdXBlcihhcHAsIHBsdWdpbik7XHJcblx0XHR0aGlzLnBsdWdpbiA9IHBsdWdpbjtcclxuXHR9XHJcblxyXG5cdGRpc3BsYXkoKTogdm9pZCB7XHJcblx0XHRsZXQgeyBjb250YWluZXJFbCB9ID0gdGhpcztcclxuXHRcdGNvbnRhaW5lckVsLmVtcHR5KCk7XHJcblx0XHRjb250YWluZXJFbC5jcmVhdGVFbChcImgyXCIsIHsgdGV4dDogdGhpcy5wbHVnaW4ubWFuaWZlc3QubmFtZSB9KTtcclxuXHJcblx0XHRuZXcgU2V0dGluZyhjb250YWluZXJFbClcclxuXHRcdFx0LnNldE5hbWUoJ091dHB1dCBmaWxlIG5hbWUnKVxyXG5cdFx0XHQuc2V0RGVzYygnU2V0IG5hbWUgb2Ygb3V0cHV0IGZpbGUgKHdpdGhvdXQgZmlsZSBleHRlbnNpb24pLiBNYWtlIHN1cmUgbm8gZmlsZSBleGlzdHMgd2l0aCB0aGlzIG5hbWUgYmVjYXVzZSBpdCB3aWxsIGJlIG92ZXJ3cml0dGVuISBJZiB0aGUgbmFtZSBpcyBlbXB0eSwgdGhlIGRlZmF1bHQgbmFtZSBpcyBzZXQuJylcclxuXHRcdFx0LmFkZFRleHQoY2IgPT4gY2Iub25DaGFuZ2UodmFsdWUgPT4ge1xyXG5cdFx0XHRcdGlmICh2YWx1ZS5sZW5ndGggPT0gMCkge1xyXG5cdFx0XHRcdFx0dGhpcy5wbHVnaW4uc2V0dGluZ3Mub3V0cHV0RmlsZU5hbWUgPSBcIkZpbmQgdW5saW5rZWQgZmlsZXMgcGx1Z2luIG91dHB1dFwiO1xyXG5cdFx0XHRcdH0gZWxzZSB7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zZXR0aW5ncy5vdXRwdXRGaWxlTmFtZSA9IHZhbHVlO1xyXG5cdFx0XHRcdH1cclxuXHRcdFx0XHR0aGlzLnBsdWdpbi5zYXZlU2V0dGluZ3MoKTtcclxuXHRcdFx0fSkuc2V0VmFsdWUodGhpcy5wbHVnaW4uc2V0dGluZ3Mub3V0cHV0RmlsZU5hbWUpKTtcclxuXHJcblx0XHRuZXcgU2V0dGluZyhjb250YWluZXJFbClcclxuXHRcdFx0LnNldE5hbWUoJ0Rpc2FibGUgd29ya2luZyBsaW5rcycpXHJcblx0XHRcdC5zZXREZXNjKCdJbmRlbnQgbGluZXMgdG8gZGlzYWJsZSB0aGUgbGluayBhbmQgdG8gY2xlYW4gdXAgdGhlIGdyYXBoIHZpZXcnKVxyXG5cdFx0XHQuYWRkVG9nZ2xlKGNiID0+IGNiLm9uQ2hhbmdlKHZhbHVlID0+IHtcclxuXHRcdFx0XHR0aGlzLnBsdWdpbi5zZXR0aW5ncy5kaXNhYmxlV29ya2luZ0xpbmtzID0gdmFsdWU7XHJcblx0XHRcdFx0dGhpcy5wbHVnaW4uc2F2ZVNldHRpbmdzKCk7XHJcblx0XHRcdH1cclxuXHRcdFx0KS5zZXRWYWx1ZSh0aGlzLnBsdWdpbi5zZXR0aW5ncy5kaXNhYmxlV29ya2luZ0xpbmtzKSk7XHJcblxyXG5cdFx0bmV3IFNldHRpbmcoY29udGFpbmVyRWwpXHJcblx0XHRcdC5zZXROYW1lKFwiRGlyZWN0b3JpZXMgdG8gaWdub3JlLlwiKVxyXG5cdFx0XHQuc2V0RGVzYyhcIkFkZCBlYWNoIGRpcmVjdG9yeSBwYXRoIGluIGEgbmV3IGxpbmVcIilcclxuXHRcdFx0LmFkZFRleHRBcmVhKGNiID0+IGNiXHJcblx0XHRcdFx0LnNldFBsYWNlaG9sZGVyKFwiRGlyZWN0b3J5L1N1YmRpcmVjdG9yeVwiKVxyXG5cdFx0XHRcdC5zZXRWYWx1ZSh0aGlzLnBsdWdpbi5zZXR0aW5ncy5kaXJlY3Rvcmllc1RvSWdub3JlLmpvaW4oXCJcXG5cIikpXHJcblx0XHRcdFx0Lm9uQ2hhbmdlKCh2YWx1ZSkgPT4ge1xyXG5cdFx0XHRcdFx0bGV0IHBhdGhzID0gdmFsdWUudHJpbSgpLnNwbGl0KFwiXFxuXCIpLm1hcCh2YWx1ZSA9PiBmb3JtYXRQYXRoKHZhbHVlLCB0cnVlKSk7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zZXR0aW5ncy5kaXJlY3Rvcmllc1RvSWdub3JlID0gcGF0aHM7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zYXZlU2V0dGluZ3MoKTtcclxuXHRcdFx0XHR9KSk7XHJcblxyXG5cclxuXHRcdG5ldyBTZXR0aW5nKGNvbnRhaW5lckVsKVxyXG5cdFx0XHQuc2V0TmFtZShcIkZpbGVzIHRvIGlnbm9yZS5cIilcclxuXHRcdFx0LnNldERlc2MoXCJBZGQgZWFjaCBmaWxlIHBhdGggaW4gYSBuZXcgbGluZSAod2l0aCBmaWxlIGV4dGVuc2lvbiEpXCIpXHJcblx0XHRcdC5hZGRUZXh0QXJlYShjYiA9PiBjYlxyXG5cdFx0XHRcdC5zZXRQbGFjZWhvbGRlcihcIkRpcmVjdG9yeS9maWxlLm1kXCIpXHJcblx0XHRcdFx0LnNldFZhbHVlKHRoaXMucGx1Z2luLnNldHRpbmdzLmZpbGVzVG9JZ25vcmUuam9pbihcIlxcblwiKSlcclxuXHRcdFx0XHQub25DaGFuZ2UoKHZhbHVlKSA9PiB7XHJcblx0XHRcdFx0XHRsZXQgcGF0aHMgPSB2YWx1ZS50cmltKCkuc3BsaXQoXCJcXG5cIikubWFwKHZhbHVlID0+IGZvcm1hdFBhdGgodmFsdWUsIGZhbHNlKSk7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zZXR0aW5ncy5maWxlc1RvSWdub3JlID0gcGF0aHM7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zYXZlU2V0dGluZ3MoKTtcclxuXHRcdFx0XHR9KSk7XHJcblx0XHRuZXcgU2V0dGluZyhjb250YWluZXJFbClcclxuXHRcdFx0LnNldE5hbWUoXCJMaW5rcyB0byBpZ25vcmUuXCIpXHJcblx0XHRcdC5zZXREZXNjKFwiSWdub3JlcyBmaWxlcywgd2hpY2ggY29udGFpbiB0aGUgZ2l2ZW4gZmlsZSBhcyBsaW5rLiBBZGQgZWFjaCBmaWxlIHBhdGggaW4gYSBuZXcgbGluZSAod2l0aCBmaWxlIGV4dGVuc2lvbiEpXCIpXHJcblx0XHRcdC5hZGRUZXh0QXJlYShjYiA9PiBjYlxyXG5cdFx0XHRcdC5zZXRQbGFjZWhvbGRlcihcIkRpcmVjdG9yeS9maWxlLm1kXCIpXHJcblx0XHRcdFx0LnNldFZhbHVlKHRoaXMucGx1Z2luLnNldHRpbmdzLmxpbmtzVG9JZ25vcmUuam9pbihcIlxcblwiKSlcclxuXHRcdFx0XHQub25DaGFuZ2UoKHZhbHVlKSA9PiB7XHJcblx0XHRcdFx0XHRsZXQgcGF0aHMgPSB2YWx1ZS50cmltKCkuc3BsaXQoXCJcXG5cIikubWFwKHZhbHVlID0+IGZvcm1hdFBhdGgodmFsdWUsIGZhbHNlKSk7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zZXR0aW5ncy5saW5rc1RvSWdub3JlID0gcGF0aHM7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zYXZlU2V0dGluZ3MoKTtcclxuXHRcdFx0XHR9KSk7XHJcblx0XHRuZXcgU2V0dGluZyhjb250YWluZXJFbClcclxuXHRcdFx0LnNldE5hbWUoXCJGaWxldHlwZXMgdG8gaWdub3JlLlwiKVxyXG5cdFx0XHQuc2V0RGVzYyhcIkFkZCBlYWNoIGZpbGV0eXBlIHNlcGFyYXRlZCBieSBjb21tYVwiKVxyXG5cdFx0XHQuYWRkVGV4dEFyZWEoY2IgPT4gY2JcclxuXHRcdFx0XHQuc2V0UGxhY2Vob2xkZXIoXCJkb2N4LHR4dFwiKVxyXG5cdFx0XHRcdC5zZXRWYWx1ZSh0aGlzLnBsdWdpbi5zZXR0aW5ncy5maWxlVHlwZXNUb0lnbm9yZS5qb2luKFwiLFwiKSlcclxuXHRcdFx0XHQub25DaGFuZ2UoKHZhbHVlKSA9PiB7XHJcblx0XHRcdFx0XHRsZXQgZXh0ZW5zaW9ucyA9IHZhbHVlLnRyaW0oKS5zcGxpdChcIixcIik7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zZXR0aW5ncy5maWxlVHlwZXNUb0lnbm9yZSA9IGV4dGVuc2lvbnM7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zYXZlU2V0dGluZ3MoKTtcclxuXHRcdFx0XHR9KSk7XHJcblx0XHRuZXcgU2V0dGluZyhjb250YWluZXJFbClcclxuXHRcdFx0LnNldE5hbWUoXCJUYWdzIHRvIGlnbm9yZS5cIilcclxuXHRcdFx0LnNldERlc2MoXCJJZ25vcmUgZmlsZXMsIHdoaWNoIGNvbnRhaW4gdGhlIGdpdmVuIHRhZy4gQWRkIGVhY2ggdGFnIHNlcGFyYXRlZCBieSBjb21tYSAod2l0aG91dCBgI2ApXCIpXHJcblx0XHRcdC5hZGRUZXh0QXJlYShjYiA9PiBjYlxyXG5cdFx0XHRcdC5zZXRQbGFjZWhvbGRlcihcInRvZG8sdW5maW5pc2hlZFwiKVxyXG5cdFx0XHRcdC5zZXRWYWx1ZSh0aGlzLnBsdWdpbi5zZXR0aW5ncy50YWdzVG9JZ25vcmUuam9pbihcIixcIikpXHJcblx0XHRcdFx0Lm9uQ2hhbmdlKCh2YWx1ZSkgPT4ge1xyXG5cdFx0XHRcdFx0bGV0IHRhZ3MgPSB2YWx1ZS50cmltKCkuc3BsaXQoXCIsXCIpO1xyXG5cdFx0XHRcdFx0dGhpcy5wbHVnaW4uc2V0dGluZ3MudGFnc1RvSWdub3JlID0gdGFncztcclxuXHRcdFx0XHRcdHRoaXMucGx1Z2luLnNhdmVTZXR0aW5ncygpO1xyXG5cdFx0XHRcdH0pKTtcclxuXHRcdG5ldyBTZXR0aW5nKGNvbnRhaW5lckVsKVxyXG5cdFx0XHQuc2V0TmFtZShcIkZpbGV0eXBlcyB0byBkZWxldGUgcGVyIGNvbW1hbmQuIFNlZSBSRUFETUUuXCIpXHJcblx0XHRcdC5zZXREZXNjKFwiQWRkIGVhY2ggZmlsZXR5cGUgc2VwYXJhdGVkIGJ5IGNvbW1hLiBcIilcclxuXHRcdFx0LmFkZFRleHRBcmVhKGNiID0+IGNiXHJcblx0XHRcdFx0LnNldFBsYWNlaG9sZGVyKFwianBnLHBuZ1wiKVxyXG5cdFx0XHRcdC5zZXRWYWx1ZSh0aGlzLnBsdWdpbi5zZXR0aW5ncy5maWxlVHlwZXNUb0RlbGV0ZS5qb2luKFwiLFwiKSlcclxuXHRcdFx0XHQub25DaGFuZ2UoKHZhbHVlKSA9PiB7XHJcblx0XHRcdFx0XHRsZXQgZXh0ZW5zaW9ucyA9IHZhbHVlLnRyaW0oKS5zcGxpdChcIixcIik7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zZXR0aW5ncy5maWxlVHlwZXNUb0RlbGV0ZSA9IGV4dGVuc2lvbnM7XHJcblx0XHRcdFx0XHR0aGlzLnBsdWdpbi5zYXZlU2V0dGluZ3MoKTtcclxuXHRcdFx0XHR9KSk7XHJcblx0XHRmdW5jdGlvbiBmb3JtYXRQYXRoKHBhdGg6IHN0cmluZywgYWRkRGlyZWN0b3J5U2xhc2g6IGJvb2xlYW4pOiBzdHJpbmcge1xyXG5cdFx0XHRpZiAocGF0aC5sZW5ndGggPT0gMClcclxuXHRcdFx0XHRyZXR1cm4gcGF0aDtcclxuXHRcdFx0cGF0aCA9IG5vcm1hbGl6ZVBhdGgocGF0aCk7XHJcblx0XHRcdGlmIChhZGREaXJlY3RvcnlTbGFzaClcclxuXHRcdFx0XHRyZXR1cm4gcGF0aCArIFwiL1wiO1xyXG5cdFx0XHRlbHNlXHJcblx0XHRcdFx0cmV0dXJuIHBhdGg7XHJcblx0XHR9XHJcblx0fVxyXG59Il0sIm5hbWVzIjpbIml0ZXJhdGVDYWNoZVJlZnMiLCJnZXRMaW5rcGF0aCIsImdldEFsbFRhZ3MiLCJQbHVnaW4iLCJNb2RhbCIsIlNldHRpbmciLCJub3JtYWxpemVQYXRoIiwiUGx1Z2luU2V0dGluZ1RhYiJdLCJtYXBwaW5ncyI6Ijs7OztBQUFBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0E7QUFDQTtBQUNBO0FBQ0EsSUFBSSxhQUFhLEdBQUcsU0FBUyxDQUFDLEVBQUUsQ0FBQyxFQUFFO0FBQ25DLElBQUksYUFBYSxHQUFHLE1BQU0sQ0FBQyxjQUFjO0FBQ3pDLFNBQVMsRUFBRSxTQUFTLEVBQUUsRUFBRSxFQUFFLFlBQVksS0FBSyxJQUFJLFVBQVUsQ0FBQyxFQUFFLENBQUMsRUFBRSxFQUFFLENBQUMsQ0FBQyxTQUFTLEdBQUcsQ0FBQyxDQUFDLEVBQUUsQ0FBQztBQUNwRixRQUFRLFVBQVUsQ0FBQyxFQUFFLENBQUMsRUFBRSxFQUFFLEtBQUssSUFBSSxDQUFDLElBQUksQ0FBQyxFQUFFLElBQUksTUFBTSxDQUFDLFNBQVMsQ0FBQyxjQUFjLENBQUMsSUFBSSxDQUFDLENBQUMsRUFBRSxDQUFDLENBQUMsRUFBRSxDQUFDLENBQUMsQ0FBQyxDQUFDLEdBQUcsQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDLEVBQUUsQ0FBQztBQUMxRyxJQUFJLE9BQU8sYUFBYSxDQUFDLENBQUMsRUFBRSxDQUFDLENBQUMsQ0FBQztBQUMvQixDQUFDLENBQUM7QUFDRjtBQUNPLFNBQVMsU0FBUyxDQUFDLENBQUMsRUFBRSxDQUFDLEVBQUU7QUFDaEMsSUFBSSxJQUFJLE9BQU8sQ0FBQyxLQUFLLFVBQVUsSUFBSSxDQUFDLEtBQUssSUFBSTtBQUM3QyxRQUFRLE1BQU0sSUFBSSxTQUFTLENBQUMsc0JBQXNCLEdBQUcsTUFBTSxDQUFDLENBQUMsQ0FBQyxHQUFHLCtCQUErQixDQUFDLENBQUM7QUFDbEcsSUFBSSxhQUFhLENBQUMsQ0FBQyxFQUFFLENBQUMsQ0FBQyxDQUFDO0FBQ3hCLElBQUksU0FBUyxFQUFFLEdBQUcsRUFBRSxJQUFJLENBQUMsV0FBVyxHQUFHLENBQUMsQ0FBQyxFQUFFO0FBQzNDLElBQUksQ0FBQyxDQUFDLFNBQVMsR0FBRyxDQUFDLEtBQUssSUFBSSxHQUFHLE1BQU0sQ0FBQyxNQUFNLENBQUMsQ0FBQyxDQUFDLElBQUksRUFBRSxDQUFDLFNBQVMsR0FBRyxDQUFDLENBQUMsU0FBUyxFQUFFLElBQUksRUFBRSxFQUFFLENBQUMsQ0FBQztBQUN6RixDQUFDO0FBdUNEO0FBQ08sU0FBUyxTQUFTLENBQUMsT0FBTyxFQUFFLFVBQVUsRUFBRSxDQUFDLEVBQUUsU0FBUyxFQUFFO0FBQzdELElBQUksU0FBUyxLQUFLLENBQUMsS0FBSyxFQUFFLEVBQUUsT0FBTyxLQUFLLFlBQVksQ0FBQyxHQUFHLEtBQUssR0FBRyxJQUFJLENBQUMsQ0FBQyxVQUFVLE9BQU8sRUFBRSxFQUFFLE9BQU8sQ0FBQyxLQUFLLENBQUMsQ0FBQyxFQUFFLENBQUMsQ0FBQyxFQUFFO0FBQ2hILElBQUksT0FBTyxLQUFLLENBQUMsS0FBSyxDQUFDLEdBQUcsT0FBTyxDQUFDLEVBQUUsVUFBVSxPQUFPLEVBQUUsTUFBTSxFQUFFO0FBQy9ELFFBQVEsU0FBUyxTQUFTLENBQUMsS0FBSyxFQUFFLEVBQUUsSUFBSSxFQUFFLElBQUksQ0FBQyxTQUFTLENBQUMsSUFBSSxDQUFDLEtBQUssQ0FBQyxDQUFDLENBQUMsRUFBRSxDQUFDLE9BQU8sQ0FBQyxFQUFFLEVBQUUsTUFBTSxDQUFDLENBQUMsQ0FBQyxDQUFDLEVBQUUsRUFBRTtBQUNuRyxRQUFRLFNBQVMsUUFBUSxDQUFDLEtBQUssRUFBRSxFQUFFLElBQUksRUFBRSxJQUFJLENBQUMsU0FBUyxDQUFDLE9BQU8sQ0FBQyxDQUFDLEtBQUssQ0FBQyxDQUFDLENBQUMsRUFBRSxDQUFDLE9BQU8sQ0FBQyxFQUFFLEVBQUUsTUFBTSxDQUFDLENBQUMsQ0FBQyxDQUFDLEVBQUUsRUFBRTtBQUN0RyxRQUFRLFNBQVMsSUFBSSxDQUFDLE1BQU0sRUFBRSxFQUFFLE1BQU0sQ0FBQyxJQUFJLEdBQUcsT0FBTyxDQUFDLE1BQU0sQ0FBQyxLQUFLLENBQUMsR0FBRyxLQUFLLENBQUMsTUFBTSxDQUFDLEtBQUssQ0FBQyxDQUFDLElBQUksQ0FBQyxTQUFTLEVBQUUsUUFBUSxDQUFDLENBQUMsRUFBRTtBQUN0SCxRQUFRLElBQUksQ0FBQyxDQUFDLFNBQVMsR0FBRyxTQUFTLENBQUMsS0FBSyxDQUFDLE9BQU8sRUFBRSxVQUFVLElBQUksRUFBRSxDQUFDLEVBQUUsSUFBSSxFQUFFLENBQUMsQ0FBQztBQUM5RSxLQUFLLENBQUMsQ0FBQztBQUNQLENBQUM7QUFDRDtBQUNPLFNBQVMsV0FBVyxDQUFDLE9BQU8sRUFBRSxJQUFJLEVBQUU7QUFDM0MsSUFBSSxJQUFJLENBQUMsR0FBRyxFQUFFLEtBQUssRUFBRSxDQUFDLEVBQUUsSUFBSSxFQUFFLFdBQVcsRUFBRSxJQUFJLENBQUMsQ0FBQyxDQUFDLENBQUMsR0FBRyxDQUFDLEVBQUUsTUFBTSxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxPQUFPLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFLEVBQUUsSUFBSSxFQUFFLEVBQUUsRUFBRSxHQUFHLEVBQUUsRUFBRSxFQUFFLEVBQUUsQ0FBQyxFQUFFLENBQUMsRUFBRSxDQUFDLEVBQUUsQ0FBQyxDQUFDO0FBQ3JILElBQUksT0FBTyxDQUFDLEdBQUcsRUFBRSxJQUFJLEVBQUUsSUFBSSxDQUFDLENBQUMsQ0FBQyxFQUFFLE9BQU8sRUFBRSxJQUFJLENBQUMsQ0FBQyxDQUFDLEVBQUUsUUFBUSxFQUFFLElBQUksQ0FBQyxDQUFDLENBQUMsRUFBRSxFQUFFLE9BQU8sTUFBTSxLQUFLLFVBQVUsS0FBSyxDQUFDLENBQUMsTUFBTSxDQUFDLFFBQVEsQ0FBQyxHQUFHLFdBQVcsRUFBRSxPQUFPLElBQUksQ0FBQyxFQUFFLENBQUMsRUFBRSxDQUFDLENBQUM7QUFDN0osSUFBSSxTQUFTLElBQUksQ0FBQyxDQUFDLEVBQUUsRUFBRSxPQUFPLFVBQVUsQ0FBQyxFQUFFLEVBQUUsT0FBTyxJQUFJLENBQUMsQ0FBQyxDQUFDLEVBQUUsQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFLENBQUMsRUFBRTtBQUN0RSxJQUFJLFNBQVMsSUFBSSxDQUFDLEVBQUUsRUFBRTtBQUN0QixRQUFRLElBQUksQ0FBQyxFQUFFLE1BQU0sSUFBSSxTQUFTLENBQUMsaUNBQWlDLENBQUMsQ0FBQztBQUN0RSxRQUFRLE9BQU8sQ0FBQyxFQUFFLElBQUk7QUFDdEIsWUFBWSxJQUFJLENBQUMsR0FBRyxDQUFDLEVBQUUsQ0FBQyxLQUFLLENBQUMsR0FBRyxFQUFFLENBQUMsQ0FBQyxDQUFDLEdBQUcsQ0FBQyxHQUFHLENBQUMsQ0FBQyxRQUFRLENBQUMsR0FBRyxFQUFFLENBQUMsQ0FBQyxDQUFDLEdBQUcsQ0FBQyxDQUFDLE9BQU8sQ0FBQyxLQUFLLENBQUMsQ0FBQyxHQUFHLENBQUMsQ0FBQyxRQUFRLENBQUMsS0FBSyxDQUFDLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxFQUFFLENBQUMsQ0FBQyxHQUFHLENBQUMsQ0FBQyxJQUFJLENBQUMsSUFBSSxDQUFDLENBQUMsQ0FBQyxHQUFHLENBQUMsQ0FBQyxJQUFJLENBQUMsQ0FBQyxFQUFFLEVBQUUsQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFLElBQUksRUFBRSxPQUFPLENBQUMsQ0FBQztBQUN6SyxZQUFZLElBQUksQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLEVBQUUsRUFBRSxHQUFHLENBQUMsRUFBRSxDQUFDLENBQUMsQ0FBQyxHQUFHLENBQUMsRUFBRSxDQUFDLENBQUMsS0FBSyxDQUFDLENBQUM7QUFDcEQsWUFBWSxRQUFRLEVBQUUsQ0FBQyxDQUFDLENBQUM7QUFDekIsZ0JBQWdCLEtBQUssQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDLEVBQUUsQ0FBQyxHQUFHLEVBQUUsQ0FBQyxDQUFDLE1BQU07QUFDOUMsZ0JBQWdCLEtBQUssQ0FBQyxFQUFFLENBQUMsQ0FBQyxLQUFLLEVBQUUsQ0FBQyxDQUFDLE9BQU8sRUFBRSxLQUFLLEVBQUUsRUFBRSxDQUFDLENBQUMsQ0FBQyxFQUFFLElBQUksRUFBRSxLQUFLLEVBQUUsQ0FBQztBQUN4RSxnQkFBZ0IsS0FBSyxDQUFDLEVBQUUsQ0FBQyxDQUFDLEtBQUssRUFBRSxDQUFDLENBQUMsQ0FBQyxHQUFHLEVBQUUsQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDLEVBQUUsR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsU0FBUztBQUNqRSxnQkFBZ0IsS0FBSyxDQUFDLEVBQUUsRUFBRSxHQUFHLENBQUMsQ0FBQyxHQUFHLENBQUMsR0FBRyxFQUFFLENBQUMsQ0FBQyxDQUFDLENBQUMsSUFBSSxDQUFDLEdBQUcsRUFBRSxDQUFDLENBQUMsU0FBUztBQUNqRSxnQkFBZ0I7QUFDaEIsb0JBQW9CLElBQUksRUFBRSxDQUFDLEdBQUcsQ0FBQyxDQUFDLElBQUksRUFBRSxDQUFDLEdBQUcsQ0FBQyxDQUFDLE1BQU0sR0FBRyxDQUFDLElBQUksQ0FBQyxDQUFDLENBQUMsQ0FBQyxNQUFNLEdBQUcsQ0FBQyxDQUFDLENBQUMsS0FBSyxFQUFFLENBQUMsQ0FBQyxDQUFDLEtBQUssQ0FBQyxJQUFJLEVBQUUsQ0FBQyxDQUFDLENBQUMsS0FBSyxDQUFDLENBQUMsRUFBRSxFQUFFLENBQUMsR0FBRyxDQUFDLENBQUMsQ0FBQyxTQUFTLEVBQUU7QUFDaEksb0JBQW9CLElBQUksRUFBRSxDQUFDLENBQUMsQ0FBQyxLQUFLLENBQUMsS0FBSyxDQUFDLENBQUMsS0FBSyxFQUFFLENBQUMsQ0FBQyxDQUFDLEdBQUcsQ0FBQyxDQUFDLENBQUMsQ0FBQyxJQUFJLEVBQUUsQ0FBQyxDQUFDLENBQUMsR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxFQUFFLEVBQUUsQ0FBQyxDQUFDLEtBQUssR0FBRyxFQUFFLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxNQUFNLEVBQUU7QUFDMUcsb0JBQW9CLElBQUksRUFBRSxDQUFDLENBQUMsQ0FBQyxLQUFLLENBQUMsSUFBSSxDQUFDLENBQUMsS0FBSyxHQUFHLENBQUMsQ0FBQyxDQUFDLENBQUMsRUFBRSxFQUFFLENBQUMsQ0FBQyxLQUFLLEdBQUcsQ0FBQyxDQUFDLENBQUMsQ0FBQyxDQUFDLENBQUMsQ0FBQyxHQUFHLEVBQUUsQ0FBQyxDQUFDLE1BQU0sRUFBRTtBQUN6RixvQkFBb0IsSUFBSSxDQUFDLElBQUksQ0FBQyxDQUFDLEtBQUssR0FBRyxDQUFDLENBQUMsQ0FBQyxDQUFD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
