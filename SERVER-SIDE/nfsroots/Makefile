NFSROOT_CONFS = $(wildcard */*/nfsroot.conf)
NFSROOT_SUITE_ARCHS = $(patsubst %/,%,$(dir $(NFSROOT_CONFS)))
NFSROOTS = $(NFSROOT_SUITE_ARCHS:%=PHONY/%)

ISOS = $(foreach distarch,$(NFSROOT_SUITE_ARCHS),$(distarch)/fai-cd-$(subst /,-,$(patsubst %/,fai-cd-%.iso,$(distarch))).iso)

FAI_CHBOOT_TMPL_SRCS = $(wildcard fai-chboot-templates/*.tmpl)
FAI_CHBOOT_TMPLS = $(FAI_CHBOOT_TMPL_SRCS:fai-chboot-templates/%=$(PXELINUX_CFG_DIR)/%)
TFTPROOT = /srv/tftp/fai
PXELINUX_CFG_DIR = $(TFTPROOT)/pxelinux.cfg

.PHONY: all templates nfsroots isos $(NFSROOTS)

all: templates nfsroots isos

templates: $(FAI_CHBOOT_TMPLS)

nfsroots: $(NFSROOTS)

isos: $(ISOS)

$(FAI_CHBOOT_TMPLS): $(PXELINUX_CFG_DIR)/%: fai-chboot-templates/%
	cp -f $< $@

$(NFSROOTS): PHONY/%: %
	/usr/sbin/fai-make-nfsroot -v -f -C '$<'

$(ISOS):
	verbose=1 /usr/sbin/fai-cd -f -M -J -C '$(@D)' '$@'
