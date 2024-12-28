FROM mcr.microsoft.com/dotnet/sdk:6.0

# Copy files common for all images
COPY 4img/* ./

# Ruby is needed to run partial builder
RUN ./prepare-apt-ruby && \
	./prepare-apt-uninit

# Env variable that influences which of .NET projects will be built
ENV KAITAI_NET=netstd

# Download .NET dependencies into ~/.nuget/packages
RUN ./prepare
