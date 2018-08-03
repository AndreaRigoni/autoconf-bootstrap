include $(top_srcdir)/Common.mk

ATOM_PROJECT_PATH = $(srcdir) $(builddir)


## HYDROGEN ##
ATOM_PACKAGES += Hydrogen language-markdown
PYTHON_PACKAGES += ipykernel

hydrogen-init: pip-install apm-install
	@ python -m ipykernel install --user

