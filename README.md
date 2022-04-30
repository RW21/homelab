# homelab

Please note that most of the stuff here is experimental and is a mess.

It does not reflect what I would do in production environments.

## Playbooks

```
ansible-playbook playbook.yaml -i hosts --become --ask-become-pass -e ansible_python_interpreter=/usr/bin/python3   
ansible-playbook playbook.yaml  -i hosts --tags "general" --limit lark-server.local --become --ask-become-pass -e ansible_python_interpreter=/usr/bin/python3 -v
```

## Cluster monitoring

https://github.com/carlosedp/cluster-monitoring

