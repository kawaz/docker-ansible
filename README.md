# Usage

## Simple case

```
cd path-to-playbook
ansible run --rm -ti \
  -v "$PWD:/work" \
  -w /work \
  kawaz/ansible \
  ansible-playbook playbook.yml
```

# memo for kawaz

## Check version

```
(
v_hub=$(curl -sL https://registry.hub.docker.com/v2/repositories/kawaz/ansible/tags/|jq -r '.results[].name' | grep ^[0-9] | sort -Vr)
v_apk=$(docker run --rm -ti alpine apk --no-cache search ansible | grep ^ansible-[0-9] | grep -oE '[0-9\.]+' | head -n1)
echo "latest tag             : $v_hub"
echo "latest asnible version : $v_apk"
)
```

## Add version tag to docker hub

```
(
docker build -t kawaz/ansible:latest . &&
v=$(docker run --rm kawaz/ansible ansible --version | grep -Eom1 '[0-9][0-9\.]+') && [[ -n $v ]] && \
docker tag kawaz/ansible:latest kawaz/ansible:"$v" && \
docker push kawaz/ansible:latest kawaz/ansible:"$v"
)
```

