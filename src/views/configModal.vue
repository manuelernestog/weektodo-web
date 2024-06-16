<template>
  <div class="modal fade" id="configModal" tabindex="-1"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">{{ $t("settings.settings") }}</h5>
          <i class="bi-x close-modal" data-bs-dismiss="modal"></i>
        </div>
        <div class="modal-body px-0" style="display: flex">
          <ul class="nav nav-tabs" id="confTab" role="tablist" style="display: none">
            <li class="nav-item" role="presentation">
              <button class="nav-link active" id="config-home-tab" data-bs-toggle="tab" data-bs-target="#config-home"
                role="tab">
                Home
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="config-general-tab" data-bs-toggle="tab" data-bs-target="#config-general"
                role="tab">
                General
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="config-display-tab" data-bs-toggle="tab" data-bs-target="#config-display"
                role="tab">
                Display
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="config-notifications-tab" data-bs-toggle="tab"
                data-bs-target="#config-notifications" role="tab">
                Notifications
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="config-data-tab" data-bs-toggle="tab" data-bs-target="#config-data" role="tab">
                Data
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="config-language-tab" data-bs-toggle="tab" data-bs-target="#config-language"
                role="tab">
                Language
              </button>
            </li>
            <li class="nav-item" role="presentation">
              <button class="nav-link" id="config-behavior-tab" data-bs-toggle="tab" data-bs-target="#config-behavior"
                role="tab">
                Behavior
              </button>
            </li>
          </ul>

          <div id="config-links-menu" class="tab-pane fade show" style="width: 340px;">
            <link-list :linkList="configLinks"></link-list>
          </div>

          <div class="tab-content px-4" id="confTab-content" style="width: 100%; height: 400px; overflow-y: auto;">
            <div class="tab-pane fade active show" id="config-general">
              <div class="d-flex flex-column mt-2 h-100">
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="calendarSetting">{{ $t("settings.calendar") }}</label>
                  <input class="form-check-input" type="checkbox" id="calendarSetting" v-model="configData.calendar"
                    @change="changeConfig('calendar', configData.calendar)" />
                </div>

                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="customListsSetting">{{ $t("settings.customLists")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="customListsSetting" v-model="configData.customList"
                    @change="changeConfig('customList', configData.customList)" />
                </div>

                <div v-if="isElectron()" class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label" for="updatesCheckSetting">{{
                    $t("settings.checkUpdates")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="updatesCheckSetting"
                    v-model="configData.checkUpdates" @change="changeConfig('checkUpdates', configData.checkUpdates)" />
                </div>

                <div v-if="isElectron()" class=" form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label" for="openOnStartup">{{
                    $t("settings.openOnStartup")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="openOnStartup" v-model="configData.openOnStartup"
                    @change="setOpenOnStart()" />
                </div>
                <div v-if="isElectron()" class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label" for="runInBackground">
                    <span>
                      {{ $t("settings.runInBackground") }}
                      <sup>
                        <i class="bi-info-circle" style="cursor: help" :title="$t('settings.runInBackgroundInfo')"> </i>
                      </sup>
                    </span>
                  </label>
                  <input class="form-check-input" type="checkbox" id="runInBackground"
                    v-model="configData.runInBackground" @change="setRunInBackground()" />
                </div>

                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="reportErrors">{{ $t("settings.reportErrors")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="reportErrors" v-model="configData.reportErrors"
                    @change="setSendErrors()" />
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="config-behavior">
              <div class="d-flex flex-column mt-2 h-100">
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="moveOldTasks">{{ $t("settings.moveOldTasks")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="moveOldTasks" v-model="configData.moveOldTasks"
                    @change="changeConfig('moveOldTasks', configData.moveOldTasks)" />
                </div>
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="weekStartOnMonday">{{ $t("settings.weekStartOnMonday")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="weekStartOnMonday" v-model="configData.weekStartOnMonday"
                    @change="changeConfig('weekStartOnMonday', configData.weekStartOnMonday)" />
                </div>
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="moveOldTasks">{{ $t("settings.startCalendarYesterday")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="moveOldTasks"
                    v-model="configData.startCalendarYesterday"
                    @change="changeConfig('startCalendarYesterday', configData.startCalendarYesterday)" />
                </div>
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="autoReorderTasks">{{ $t("settings.autoReorderTasks")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="autoReorderTasks"
                    v-model="configData.autoReorderTasks"
                    @change="changeConfig('autoReorderTasks', configData.autoReorderTasks)" />
                </div>
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="moveCompletedTaskToBottom">{{
                    $t("settings.moveCompletedTaskToBottom")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="moveCompletedTaskToBottom"
                    v-model="configData.moveCompletedTaskToBottom"
                    @change="changeConfig('moveCompletedTaskToBottom', configData.moveCompletedTaskToBottom)" />
                </div>
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label flex-fill" for="moveCompletedSubTaskToBottom">{{
                    $t("settings.moveCompletedSubTaskToBottom")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="moveCompletedSubTaskToBottom"
                    v-model="configData.moveCompletedSubTaskToBottom"
                    @change="changeConfig('moveCompletedSubTaskToBottom', configData.moveCompletedSubTaskToBottom)" />
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="config-display">
              <div class="d-flex flex-column mt-2 h-100">


                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label" for="darkThemeSetting">{{
                    $t("settings.darkTheme")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="darkThemeSetting" v-model="configData.darkTheme"
                    @change="changeConfig('darkTheme', configData.darkTheme)" />
                </div>

                <div v-if="isElectron()" class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label" for="darkTrayIcon">{{
                    $t("settings.darkIcon")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="darkTrayIcon" v-model="configData.darkTrayIcon"
                    @change="setDarkTrayIcon" />
                </div>
                <div class="horizontal-divider mb-3"></div>
                <div class="px-1 mb-3">
                  <label for="columnsConfig" class="form-check-label">{{ $t("settings.columns") }}: {{
                    configData.columns
                  }}</label>
                  <input type="range" class="form-range mt-2 px-2" min="1" max="12" id="columnsConfig"
                    v-model="configData.columns" @change="changeConfig('columns', configData.columns)" />
                </div>

                <div class="px-1 mb-3">
                  <label for="columnsConfig" class="form-check-label">{{ $t("settings.lists_columns") }}: {{
                    configData.customColumns
                  }}</label>
                  <input type="range" class="form-range mt-2 px-2" min="1" max="12" id="columnsConfig"
                    v-model="configData.customColumns"
                    @change="changeConfig('customColumns', configData.customColumns)" />
                </div>

                <div class="px-1 mb-3 zoom-config">
                  <label for="zoomConfig" class="form-check-label">{{ $t("settings.zoom") }}: {{ configData.zoom
                  }}%</label>
                  <input type="range" class="form-range mt-2 px-2" min="50" max="200" id="zoomConfig" step="5"
                    v-model="configData.zoom" @change="changeConfig('zoom', configData.zoom)" />
                </div>

                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label" for="compactViewSetting">{{
                    $t("settings.compactView")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="compactViewSetting" v-model="configData.compactView"
                    @change="changeConfig('compactView', configData.compactView)" />
                </div>
                <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between">
                  <label class="form-check-label" for="fullscreenToDoModal">{{
                    $t("settings.fullscreenToDoModal")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="fullscreenToDoModal"
                    v-model="configData.fullscreenToDoModal"
                    @change="changeConfig('fullscreenToDoModal', configData.fullscreenToDoModal)" />
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="config-notifications">
              <div class="d-flex flex-column mt-3 h-100">
                <div v-if="isElectron()" class="orm-check form-switch d-flex px-0 mb-3  justify-content-between">
                  <label class="form-check-label" style="margin-left: 0px" for="notificationOnStartup">{{
                    $t("settings.notificationOnStartup")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="notificationOnStartup"
                    v-model="configData.notificationOnStartup"
                    @change="changeConfig('notificationOnStartup', configData.notificationOnStartup)" />
                </div>

                <div class="form-check form-switch d-flex px-0 mb-3  justify-content-between">
                  <label class="form-check-label" style="margin-left: 0px" for="notificationIndicator">{{
                    $t("settings.notificationIndicator")
                  }}</label>
                  <input class="form-check-input" type="checkbox" id="notificationIndicator"
                    v-model="configData.notificationIndicator"
                    @change="changeConfig('notificationIndicator', configData.notificationIndicator)" />
                </div>

                <div class="horizontal-divider mb-3"></div>

                <label for="notificationSound" class="form-label">{{ $t("settings.notificationSound") }}:</label>
                <div class="d-flex">
                  <select id="notificationSound" class="col-sm-9 form-select flex-fill"
                    aria-label="Default select example" v-model="configData.notificationSound" @change="
                      changeConfig('notificationSound', configData.notificationSound)
                      ">
                    <option value="none">None</option>
                    <option value="pop">Pop</option>
                    <option value="bell">Bell</option>
                    <option value="soft-bell">Soft Bell</option>
                    <option value="soft">Soft</option>
                    <option value="tiny">Tiny</option>
                    <option value="piano">Piano</option>
                    <option value="positive">Positive</option>
                    <option value="metal">Metal</option>
                  </select>
                  <button class="btn" style="margin-left: 8px" type="button" @click="playSound">
                    <i class="bi-play-circle a"></i>
                  </button>
                </div>
              </div>


            </div>
            <div class="tab-pane fade" id="config-data">
              <div class="d-flex flex-column mt-2 h-100">
                <div>
                  <div>
                    <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between align-items-center">
                      <label class="form-check-label" for="export-data-btn">{{ $t("settings.exportData") }}</label>
                      <button id="export-data-btn" type="button" class="btn py-1 px-2 border" style="width: 140px;"
                        @click="exportData">
                        <i class="icons bi-cloud-arrow-down mx-2"></i>
                        {{ $t("settings.export") }}
                      </button>
                    </div>

                    <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between align-items-center">
                      <label class="form-check-label" for="import-data-btn">{{ $t("settings.importData") }}</label>
                      <button id="import-data-btn" type="button" class="btn py-1 px-2 border" style="width: 140px;"
                        @click="$refs.loadData.click">
                        <i class="icons bi-cloud-arrow-up mx-2"></i>
                        {{ $t("settings.import") }}
                      </button>
                    </div>

                    <div class="form-check form-switch d-flex px-1 mb-3 justify-content-between align-items-center">
                      <label class="form-check-label" for="clear-data-btn">{{ $t("settings.clearData") }}</label>
                      <button id="clear-data-btn" type="button" class="btn py-1 px-2 border" style="width: 140px;"
                        data-bs-dismiss="modal" data-bs-toggle="modal" data-bs-target="#clearDataModal">
                        <i class="icons bi-x-circle mx-2"></i>
                        {{ $t("settings.clear") }}
                      </button>
                    </div>
                  </div>
                  <input type="file" id="file-selector" class="d-none" accept=".wtdb" ref="loadData"
                    @change="importData($event)" />
                </div>
              </div>
            </div>
            <div class="tab-pane fade" id="config-language">
              <div class="d-flex flex-column mt-2 h-100">
                <label for="language" class="form-label">{{ $t("settings.language") }}:</label>
                <select id="language" class="col-sm-9 form-select" aria-label="Default select example"
                  v-model="configData.language" @change="setLanguage">
                  <option value="en">English</option>
                  <option value="es">Español</option>
                  <option value="fr">Français</option>
                  <option value="de">Deutsch</option>
                  <option value="it">Italiano</option>
                  <option value="pt">Português</option>
                  <option value="ru">русский</option>
                  <option value="hi">हिंदी</option>
                  <option value="ja">日本</option>
                  <option value="pl">Polski</option>
                  <option value="ar">عرب</option>
                  <option value="ko">한국어</option>
                  <option value="zh_cn">简体中文</option>
                  <option value="zh_tw">繁體中文</option>
                  <option value="uk">український</option>
                  <option value="tr">Türk</option>
                  <option value="vi">Tiếng Việt</option>
                  <option value="he">עִברִית</option>
                  <option value="ca">Català</option>

                </select>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="position-fixed bottom-0 end-0 p-3" style="z-index: 1056">
      <toast-message ref="invalidFile" id="invalidFile" text="$t('settings.invalidFile')"></toast-message>
    </div>
  </div>
</template>

<script>
import configRepository from "../repositories/configRepository";
import toastMessage from "../components/toastMessage";
import exportTool from "../helpers/exportTool";
import linkList from "../components/linkList";
import configList from "./configList";
import notifications from "../helpers/notifications";
import { Modal } from "bootstrap";

export default {
  name: "configModal",
  components: { toastMessage, linkList },
  props: {
    configProp: { required: true },
  },
  data() {
    return {
      configData: this.$store.getters.config,
    };
  },
  methods: {
    changeConfig: function (key, val) {
      this.$nextTick(function () {
        this.$store.commit("updateConfig", { val: val, key: key });
        configRepository.update(this.$store.getters.config);
        if (key === "language") this.$i18n.locale = this.configData.language;
        if (key === "columns") {
          setTimeout(
            function () {
              this.$emit("changeColumns");
            }.bind(this),
            50
          );
        }
      });
    },
    exportData: function () {
      let configModal = Modal.getInstance(document.getElementById("configModal"));
      configModal.hide();
      let exportingModal = new Modal(document.getElementById("exportingModal"), { backdrop: "static" });
      exportingModal.show();
      exportTool.export();
    },
    importData: function (event) {
      let configModal = Modal.getInstance(document.getElementById("configModal"));
      configModal.hide();
      let importingModal = new Modal(document.getElementById("importingModal"), { backdrop: "static" });
      importingModal.show();
      exportTool.import(event);
    },
    isElectron: function () {
      let isElectron = require("is-electron");
      return isElectron();
    },
    goHome: function () {
      document.getElementById("config-home-tab").click();
    },
    setOpenOnStart: function () {
      this.changeConfig("openOnStartup", this.configData.openOnStartup);
      this.$nextTick(function () {
        if (this.isElectron()) {
          const { ipcRenderer } = require('electron');
          ipcRenderer.send('set-open-on-startup', this.configData.openOnStartup);
        }
      });
    },
    setRunInBackground: function () {
      this.changeConfig("runInBackground", this.configData.runInBackground);
      this.$nextTick(function () {
        if (this.isElectron()) {
          const { ipcRenderer } = require('electron');
          ipcRenderer.send('set-run-in-background', this.configData.runInBackground);
        }
      });
    },
    setLanguage: function () {
      this.changeConfig('language', this.configData.language);
      this.$nextTick(function () {
        if (this.isElectron()) {
          const { ipcRenderer } = require('electron');
          ipcRenderer.send('set-tray-context-menu-label', { open: this.$t("ui.open"), quit: this.$t("ui.quit") });
        }
      });
    },
    setSendErrors: function () {
      this.changeConfig('reportErrors', this.configData.reportErrors);
    },
    setDarkTrayIcon: function () {
      this.changeConfig('darkTrayIcon', this.configData.darkTrayIcon);
      this.$nextTick(function () {
        const { ipcRenderer } = require('electron');
        ipcRenderer.send('set-dark-tray-icon', this.configData.darkTrayIcon);
      });
    },
    playSound: function () {
      notifications.playNotificationSound(
        this.$store.getters.config.notificationSound
      );
    },
  },
  computed: {
    configLinks: function () {
      return configList.configList(this);
    },
    watch: {
      configProp: function (newVal) {
        this.configData = newVal;
      }
    }
  },
};
</script>

<style scoped lang="scss">
@import "../assets/style/globalVars";

.form-check-input {
  width: 2.8em !important;
  height: 1.4em !important;
}

#config-links-menu {
  border-right: 1px solid rgba(0, 0, 0, 0.06);

.dark-theme & {
  border-right: 1px solid rgba(255, 255, 255, 0.06);
}
}


.icons {
  font-size: 18px;
  margin-right: 5px;
}

.form-check-label {
  margin-left: 10px;
  padding-top: 5px;
}

.dark-theme .form-select {
  background-color: #15161e;
  border: 1px solid #30363d;
  color: #c9d1d9;
}

.form-select:focus {
  box-shadow: none;
}

.modal-dialog {
  max-width: 800px;
  max-height: 500px;
}

.form-range::-webkit-slider-thumb {
  background: $check-color;

  .dark-theme & {
    background: $dt-check-color;
  }
}

.form-range::-webkit-slider-thumb {
  background: $check-color;

  .dark-theme & {
    background: $dt-check-color;
  }
}

.form-range::-ms-thumb {
  background: $check-color;

  .dark-theme & {
    background: $dt-check-color;
  }
}


@-moz-document url-prefix() {
  .zoom-config {
    display: none;
  }
}
</style>