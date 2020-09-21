# Minimal makefile for Sphinx documentation
# 

ak__PYTHON_PACKAGES += sphinx recommonmark

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?= 
SPHINXBUILD   ?= sphinx-build

# Put it first so that "make" without argument is like "make help".
.PHONY: sphinx-help
sphinx-help: ##@sphinx het all possible commands
sphinx-help: # pip-install
	@$(SPHINXBUILD) -M help "$(abs_srcdir)" "$(abs_builddir)" $(SPHINXOPTS) $(O)

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
sphinx-: ##@sphinx commands
sphinx-%: conf.py # pip-install 
	@$(SPHINXBUILD) -b $* -c $(dir $<) "$(abs_srcdir)" "$(abs_builddir)/$*"  $(SPHINXOPTS) $(O)


# SPHINX VARIABLES

export SX_TITLE     ?= $(PACKAGE)
export SX_COPYRIGHT ?= Andrea Rigoni
export SX_AUTHOR    ?= $(PACKAGE_BUGREPORT)
export PACKAGE_VERSION

export SX_EXTENSIONS ?= recommonmark

export SX_templates = $(abs_top_srcdir)/conf/autoconf-sphinx/config/_templates
export SX_static    = $(abs_top_srcdir)/conf/autoconf-sphinx/config/_static


# GENERATE CONF .py

spynx-gen-conf: ##@sphinx generate conf.py example
spynx-gen-conf: $(srcdir)/conf.py

## PERL SUBST ##
$(srcdir)/conf.py: __ax_pl_envsubst = $(PERL) -pe 's/([^\\]|^)\$$\{([a-zA-Z_][a-zA-Z_0-9]*)\}/$$1.$$ENV{$$2}/eg' < $1 > $2
$(srcdir)/conf.py: $(abs_top_srcdir)/conf/autoconf-sphinx/config/conf.py.in
	@ $(call __ax_pl_envsubst,$<,$@); 

