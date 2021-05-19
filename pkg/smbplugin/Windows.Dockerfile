ARG OSVERSION
ARG ARCH=amd64
FROM mcr.microsoft.com/windows/servercore:${OSVERSION} as core

FROM mcr.microsoft.com/windows/nanoserver:${OSVERSION}
LABEL description="CSI SMB plugin"

ARG ARCH=amd64
COPY ./_output/${ARCH}/smbplugin.exe /smbplugin.exe
COPY --from=core /Windows/System32/netapi32.dll /Windows/System32/netapi32.dll
USER ContainerAdministrator
ENTRYPOINT ["/smbplugin.exe"]
