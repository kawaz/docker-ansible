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

## Add version tag to docker hub

```
docker pull kawaz/ansible:latest && \
v=$(docker run --rm kawaz/ansible ansible --version | grep -Eom1 '[0-9][0-9a-zA-Z\._-]+') && [[ -n $v ]] && \
docker tag kawaz/ansible:latest kawaz/ansible:"$v" && \
docker push kawaz/ansible:"$v"
```

