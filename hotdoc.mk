$(if $(HOTDOC),,$(error Need to define HOTDOC))

define hotdoc-conf-run
$(1): $(shell $(HOTDOC) --print-dependencies --conf-file $(basename $(1)))
	hotdoc run --conf-file $(basename $(1)) && touch $(1)
all-local: $(1)
endef

$(foreach conf,$(HOTDOC_CONF_FILES),$(eval $(call hotdoc-conf-run,$(addsuffix .stamp, $(conf)))))

clean-local:
	$(foreach conf, $(HOTDOC_CONF_FILES), \
	rm -rf $(shell $(HOTDOC) --get-conf-path output --conf-file $(conf)) && \
	rm -rf $(shell $(HOTDOC) --get-private-folder --conf-file $(conf)) && \
	rm -f $(addsuffix .stamp, $(conf)))

dist-hotdoc:
	$(foreach conf, $(HOTDOC_CONF_FILES), \
	$(foreach fname, $(shell $(HOTDOC) --get-markdown-files --conf-file $(conf)), \
	mkdir -p $(distdir)/$(dir $(fname)) && cp $(fname) $(distdir)/$(fname)))

install-hotdoc-html:
	$(foreach conf, $(HOTDOC_CONF_FILES), \
	@hotdoc_html_dir=`$(HOTDOC) --get-conf-path output --conf-file $(conf)`/html; \
	if [ -d "$$hotdoc_html_dir" ]; then \
	  $(AMTAR) -C "$$hotdoc_html_dir" --mode="u=rwX,og=r-X" -zcf dist.tgz . && \
          $(mkinstalldirs) $(DESTDIR)$(htmldir) && \
          $(AMTAR) -C $(DESTDIR)$(htmldir) -p -xzf dist.tgz && \
          rm -f dist.tgz && \
	  echo "Installed html documentation in $(DESTDIR)$(htmldir)" ; \
	else \
	  echo "Nothing to install in $$hotdoc_html_dir" ; \
	fi)

install-hotdoc-devhelp:
	$(foreach conf, $(HOTDOC_CONF_FILES), \
	@hotdoc_devhelp_dir=`$(HOTDOC) --get-conf-path output --conf-file $(conf)`/devhelp; \
	if [ -d "$$hotdoc_devhelp_dir" ]; then \
	  $(AMTAR) -C "$$hotdoc_devhelp_dir" --mode="u=rwX,og=r-X" -zcf devhelp_dist.tgz . && \
          $(mkinstalldirs) $(DESTDIR)$(prefix)/share/devhelp/books && \
          $(AMTAR) -C $(DESTDIR)$(prefix)/share/devhelp/books -p -xzf devhelp_dist.tgz && \
          rm -f devhelp_dist.tgz && \
	  echo "Installed devhelp books in $(DESTDIR)$(prefix)/share/devhelp/books" ; \
	else \
	  echo "Nothing to install in $$hotdoc_devhelp_dir" ; \
	fi)

install-hotdoc: install-hotdoc-html install-hotdoc-devhelp

uninstall-hotdoc-html:
	@rm -rf $(DESTDIR)$(htmldir)

hotdoc_devhelp_dirs = $(wildcard $(shell $(HOTDOC) --get-conf-path output --conf-file $(conf))/devhelp/*)

uninstall-hotdoc-devhelp:
	$(foreach conf, $(HOTDOC_CONF_FILES), \
	$(foreach fname, $(hotdoc_devhelp_dirs), \
	rm -rf $(DESTDIR)$(prefix)/share/devhelp/books/$(notdir $(fname))))

uninstall-hotdoc: uninstall-hotdoc-html uninstall-hotdoc-devhelp

install-data-local: install-hotdoc

uninstall-local: uninstall-hotdoc

dist-hook: dist-hotdoc
