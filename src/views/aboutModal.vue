<template>
  <div class="modal fade" id="aboutModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">{{ $t("about.about") }}</h5>
          <i class="bi-x close-modal" data-bs-dismiss="modal"></i>
        </div>
        <div class="modal-body">
          <div class="d-flex flex-column" style="text-align: center; margin-top: 10px">
            <img
              class="logo align-self-center"
              src="imgweektodo-isologo-color.svg"
              alt="WeekToDo"
              title="WeekToDo Logo"
              width="256"
            />
            <img
              class="logo logo-white align-self-center"
              src="imgweektodo-isologo-white.svg"
              alt="WeekToDo"
              title="WeekToDo Logo"
              width="256"
            />
            <!-- <h5 style="margin-top: 15px; margin-bottom: 2px;">WeekToDo</h5> -->
            <span class="mt-3" style="font-size: 0.75rem"
              >{{ $t("about.version") }} {{ version }} •
              <a
                href="https://weektodo.me/changelog"
                target="_blank"
                style="font-size: 0.75rem; cursor: pointer; opacity: 0.7; text-decoration: none"
              >
                {{ $t("ui.changeLog") }}
              </a>
            </span>
            <span>
              <div class="visit-site mt-2 mb-3" style="font-size: 0.75rem">
                <a href="https://weektodo.me" target="_blank">{{ $t("about.site") }}</a>
              </div>
            </span>
            <div class="d-flex align-self-center">
              <a href="https://weektodo.me/blog/1" target="_blank" title="Blog"> <i class="bi-rss mx-2"></i></a>
              <!-- <a href="https://twitter.com/weektodo" target="_blank" title="Twitter"> <i class="bi-twitter mx-2"></i></a> -->
              <a href="https://github.com/manuelernestog/weektodo" target="_blank" title="Github">
                <i class="bi-github mx-2"></i
              ></a>
              <a href="mailto:contact@weektodo.me"> <i class="bi-envelope mx-2" :title="$t('about.email')"></i></a>
            </div>
          </div>
          <div class="horizontal-divider mt-3 mb-3"></div>
          <div>
            <div style="margin-top: 10px">
              <div class="row">
                <a href="https://manuelernestog.github.io" target="_blank" class="row" style="text-decoration: none">
                  <div class="col-md-3">
                    <img
                      class="align-self-center"
                      src="Avatar.webp"
                      alt="Manuel Ernesto Garcia"
                      title="Manuel Ernesto Garcia"
                      width="64"
                    />
                  </div>
                  <div class="col-md-9 pt-3">
                    <h6 class="mb-1">{{ $t("about.devName") }}</h6>
                    <div style="font-size: 0.7rem; opacity: 0.7">{{ $t("about.dev") }}</div>
                  </div>
                </a>
              </div>
              <div class="horizontal-divider mt-3 mb-2"></div>
              <div
                class="text-center text-uppercase px-2 d-flex justify-content-center flex-wrap"
                style="font-size: 0.8rem; opacity: 0.8; line-height: 20px"
              >
                <a class="mx-2" href="https://weektodo.me#sponsors" target="_blank" style="text-decoration: none">
                  {{ $t("about.sponsors") }}
                </a>
                <a class="mx-2" style="text-decoration: none" href="https://weektodo.me/about" target="_blank">
                  {{ $t("about.contributors") }}
                </a>
                <a class="mx-2" style="text-decoration: none" href="https://weektodo.me/license" target="_blank">
                  {{ $t("about.license") }}
                </a>
              </div>
              <div class="horizontal-divider mt-2 mb-3"></div>
              <div class="d-flex">
                <span style="margin-top: 10px; margin-right: 10px"
                  >{{ $t("about.madeWith") }} <i class="bi-heart-fill" style="color: red"></i> {{ $t("about.inCuba") }}</span
                >
                <a class="btn flex-fill" href="https://weektodo.me/support-us" target="_blank"
                  >{{ $t("donate.supportUs") }}
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <sponsor-modal ref="sponsorsModal"></sponsor-modal>
  <collaborators-modal ref="collaboratorsModal"></collaborators-modal>
</template>

<script>
import version_json from "../../public/version.json";

export default {
  name: "aboutModal",
  data() {
    return {
      version: version_json.version,
    };
  },
};
</script>

<style scoped>
.modal-dialog {
  max-width: 360px;
}

a,
a:hover {
  color: unset;
}

.visit-site {
  cursor: pointer;
}
</style>

<style>
.logo-white {
  display: none;
}

.dark-theme {
  .modal-dialog .logo {
    display: none;
  }
  .modal-dialog .logo-white {
    display: block;
    opacity: 0.95;
  }
}
</style>
