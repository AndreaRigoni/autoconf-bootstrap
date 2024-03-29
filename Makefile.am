## ////////////////////////////////////////////////////////////////////////// //
##
## This file is part of the autoconf-bootstrap project.
## Copyright 2018 Andrea Rigoni Garola <andrea.rigoni@igi.cnr.it>.
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.
##
## ////////////////////////////////////////////////////////////////////////// //

include Common.mk
# include $(top_srcdir)/conf/kscripts/yocto.mk


AM_MAKEFLAGS = -j$(MAKE_PROCESS)
ACLOCAL_AMFLAGS = -I conf/m4

SUBDIRS = conf/kconfig ext docs examples

all: ## all target ( default if no target selected )
all:

clean: ## clean

# these are example of varaiables comments that appear in help
#@ CFLAGS     set C/C++ compiler flags
#@ CPPFLAGSS  set C/C++ precompiler flags

DISTCLEANFILES = .config .config.old

hello.log: ##@log write hello.log file
hello.log:
	@ echo "hello bootstrap" > $@


#@log EXAMPLE_STRING_VAR set this variable for print-hello target
print-hello: ##@log print variable
print-hello: EXAMPLE_STRING_VAR = not set
print-hello:
	@ echo "this is the var: $(EXAMPLE_STRING_VAR)"


# if MAKE_RPMS
# rpm: @RPM_TARGET@
# $(RPM_TARGET): $(DISTFILES)
# 	${MAKE} dist
# 	-mkdir -p $(RPM_DIR)/SRPMS
# 	-mkdir -p `dirname $(RPM_TARGET)`
# 	$(RPM_PROG) $(RPM_ARGS) $(RPM_TARBALL)
# 	@echo Congratulations, $(RPM_TARGET) "(and friends)" should now exist.
# else
# endif

docker-rpm-builder-install:
	$(MAKE) -C ext $@

rpm: ##@rpm build rpm for DOCKER_IMAGE
rpm: DOCKER_IMAGE = alanfranz/docker-rpm-builder-configurations:centos-7
rpm: docker-rpm-builder-install autoconf-bootstrap.spec dist
	docker-rpm-builder dir $(DOCKER_IMAGE) . $(TMP)/
	

DOCKER_TARGETS = rpm-test
rpm-test: ##@rpm test created rpm packages
rpm-test: DOCKER_CONTAINER = rpm-test
rpm-test: DOCKER_IMAGE = alanfranz/docker-rpm-builder-configurations:centos-7
rpm-test: $(wildcard $(TMP)/$(build_cpu)/*.rpm)
	rpm -qlp $^
	rpm -Uvvvh --test $^



