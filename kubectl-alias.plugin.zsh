#!/usr/bin/env zsh

if [ -x "$(command which kubectl)" ]; then
  alias kc='kubectl'
  alias kcdd='kubectl describe deployment'
  alias kcdn='kubectl describe node'
  alias kcdp='kubectl describe pod'
  alias kcgd='kubectl get deployments'
  alias kcgdan='kubectl get deployments --all-namespaces'
  alias kcgn='kubectl get nodes'
  alias kcgp='kubectl get pods'
  alias kcgpan='kubectl get pods --all-namespaces'
  # open dashboard of active cluster
  alias kcfod='kubectl -n kube-system port-forward $(kubectl get pods -n kube-system -l k8s-app=kubernetes-dashboard | awk {'print $1'} | tail -1) 9943:8443 >/dev/null &; $BROWSER https://localhost:9943'
  # print token of active cluster
  alias kcpt='kubectl -n kube-system describe secret $(kubectl -n kube-system get secret | awk '\''/^deployment-controller-token-/{print $1}'\'') | awk '\''$1=="token:"{print $2}'\'''
  alias kcod='$BROWSER https://localhost:9943'
fi
