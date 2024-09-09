detect_docker()
{
	if docker --version >/dev/null 2>/dev/null; then
		DOCKER_BIN=docker
	elif podman --version >/dev/null 2>/dev/null; then
		DOCKER_BIN=podman
		EXTRA_OPTS='--security-opt label=disable'
	else
		echo "ERROR: Docker or Podman binary not found."
		exit 1
	fi
}

# Determine image name from current working directory
derive_img_name()
{
	local ALL=$(pwd | sed 's,^.*/src/,,')
	local TARGET=$(echo "$ALL" | cut -d/ -f1)
	local REST=$(echo "$ALL" | cut -d/ -f2)

	IMG_NAME="kaitai-$TARGET-$REST"
}

detect_docker
derive_img_name
