source /opt/concourse-java.sh

setup_symlinks
if [[ -d $PWD/embedmongo && ! -d $HOME/.embedmongo ]]; then
	ln -s "$PWD/embedmongo" "$HOME/.embedmongo"
fi

if [[ -n $DOCKER_HUB_USERNAME ]]; then
	docker login -u $DOCKER_HUB_USERNAME -p $DOCKER_HUB_PASSWORD
	docker pull paketobuildpacks/run:tiny-cnb
	docker pull springci/spring-boot-cnb-builder:0.0.1
fi

cleanup_maven_repo "org.springframework.boot"
