NAME = $(shell basename $(shell pwd))
PATCH = misc/${NAME}.patch
TWEAKS =
TITLE = Unset CFQ IO Scheduler
DESCRIPTION = Remove the cfq override in /etc/init.d/swaphack.sh which forces the io scheduler to cfq. This causes problems for kernels such as Fxxx or warthog that have the io scheduler set to something other than cfq such as anticipatory.
CATEGORY = Misc
VERSIONS = 1.4.5-138 2.1.0-19 2.1.1-22 2.1.2-31 2.2.0-17 2.2.3-50 2.2.4-5 3.0.2-8 3.0.5-4
ICON = http://www.webos-internals.org/images/f/f9/Icon_WebOSInternals_Patch.png
SCREENSHOTS =
META_SUB_VERSION = 1

include ../common.mk

include ../modifications.mk

MAINTAINER = WebOS Internals
HOMEPAGE = http://www.webos-internals.org/