NFSROOT_CONFS = $(wildcard */*/nfsroot.conf)
NFSROOT_SUITE_ARCHS = $(dir $(NFSROOT_CONFS))
NFSROOTS = $(NFSROOT_SUITE_ARCHS:%=PHONY/%)

FAI_CHBOOT_TMPL_SRCS = $(wildcard fai-chboot-templates/*.tmpl)
FAI_CHBOOT_TMPLS = $(FAI_CHBOOT_TMPL_SRCS:fai-chboot-templates/%=$(PXELINUX_CFG_DIR)/%)
TFTPROOT = /srv/tftp/fai
PXELINUX_CFG_DIR = $(TFTPROOT)/pxelinux.cfg


.PHONY: $(NFSROOTS)

all: $(FAI_CHBOOT_TMPLS) $(NFSROOTS)

$(FAI_CHBOOT_TMPLS): $(PXELINUX_CFG_DIR)/%: fai-chboot-templates/%
	cp -f $< $@

$(NFSROOTS): PHONY/%: %
	/usr/sbin/fai-make-nfsroot -f -C '$<'
