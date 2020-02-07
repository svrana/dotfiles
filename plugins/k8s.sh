#source <(kubectl completion bash) too slow...

alias kube-token='grep id-token ~/.kube/config | cut -d':' -f2 | cut -b 2-'
alias k='kubectl'
complete -F __start_kubectl k

kc() {
    echo "Cluster: $(kubectl config current-context)"
    echo "Namespace: $(kubectl config view | grep namespace: | cut -d':' -f2 | cut -b 2-)"
}
