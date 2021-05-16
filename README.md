# homelab

## Playbooks

```
ansible-playbook playbook.yaml -i hosts --become --ask-become-pass -e ansible_python_interpreter=/usr/bin/python3   
ansible-playbook playbook.yaml  -i hosts --tags "general" --limit lark-server.local --become --ask-become-pass -e ansible_python_interpreter=/usr/bin/python3 -v
```

## lark-server

Remember to restart `systemd-resolved` if network discovery fails!


