DISTRO_NAME
---

Linux distribution name.

If linux distribution isn't detected, variable has ``UNKNOWN`` value, otherwise has only name without release. For example ``ARCH LINUX``. However, if linux has been found other than on the cmake lists, can be holded distribution name with his version then (Especially, when distro has been found in /etc/issue file)
