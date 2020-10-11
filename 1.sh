repeat ()
{
    local i max;
    max=$1;
    shift;
    for ((i=1; i <= max ; i++))
    do
        eval "$@";
    done
}

repeat 1000000 openssl rand -hex 5 > ns.sh

sed -i -e 's/^/kubectl create ns /' ns.sh 

sed -e 's/^/kubectl delete ns /' ns.sh > ns1.sh
sed -i -e 's/$/ --force --grace-period=0 --wait=false/' ns1.sh

