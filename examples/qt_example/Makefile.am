# //////////////////////////////////////////////////////////////////////////// #
# //  EXAMPLE  /////////////////////////////////////////////////////////////// #
# //////////////////////////////////////////////////////////////////////////// #
#
include $(top_srcdir)/Common.mk
include $(top_srcdir)/conf/kscripts/qtdesktop.mk


PRO = qt_example.pro

## TODO: make this smarter defining sources here and then passing it to qt
EXTRA_DIST = $(PRO) \
             mainwindow.ui \
             mainwindow.h \
             main.cpp \
             mainwindow.cpp

all: $(TARGET)
clean: clean-local
