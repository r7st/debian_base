debian_base is intended to be supplementary configuration/hardening to the devsec ansible hardening collection found here:

https://github.com/dev-sec/ansible-collection-hardening

It runs on Debian 11.

It can be run with something like the following playbook:
```
- hosts: all
  become: true
  collections:
    - devsec.hardening
  roles:
    - role: os_hardening
      vars:
        - os_auth_pw_max_age: 99999
        - os_auth_lockout_time: 300
      when: devsec_os_harden | default(true)
      tags: devsec_os_hardening_role
    - role: ssh_hardening
      vars:
        - ssh_permit_root_login: 'without-password'
        - sshd_authenticationmethods: 'publickey'
        - sftp_enabled: true
        - network_ipv6_enable: false
      when: devsec_ssh_harden | default(true)
      tags: devsec_ssh_hardening_role
    - role: debian_base
      tags: debian_base_role
```
