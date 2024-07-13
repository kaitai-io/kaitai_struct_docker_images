FROM mcr.microsoft.com/dotnet/sdk:6.0

# Copy files common for all images
COPY 4img/* ./

# Ruby is needed to run partial builder
RUN ./prepare-apt-ruby && \
	./prepare-apt-uninit

# Env variable that influences which of .NET projects will be built
ENV KAITAI_NET=netstd

# Download .NET dependencies into ~/.nuget/packages
RUN \
	git clone https://github.com/kaitai-io/kaitai_struct_csharp_runtime /download/runtime/csharp && \
	git clone https://github.com/kaitai-io/kaitai_struct_tests /download/tests && \
	\
	cd /download/tests && \
	./run-csharp --project && \
	dotnet restore spec/csharp/kaitai_struct_csharp_tests_netstd/kaitai_struct_csharp_tests_netstd.csproj && \
	\
	rm -rf /download
