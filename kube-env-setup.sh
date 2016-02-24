
#Add AT repo
cat <<EOF>/etc/yum.repos.d/at9_0.repo
[at9.0]
name=Advance Toolchain Unicamp FTP
baseurl=ftp://ftp.unicamp.br/pub/linuxpatch/toolchain/at/redhat/RHEL7
failovermethod=priority
enabled=1
gpgcheck=1
gpgkey=ftp://ftp.unicamp.br/pub/linuxpatch/toolchain/at/redhat/RHEL7/gpg-pubkey-6976a827-5164221b
EOF

#Install AT 9.0 and set PATH
yum install -y advance-toolchain-at9.0-runtime \
               advance-toolchain-at9.0-devel \
               advance-toolchain-at9.0-perf \
               advance-toolchain-at9.0-mcore-libs


#Install golang

git clone https://github.com/clnperez/ppc64le-gc.git
cd ppc64le-gc
cp go-linux-ppc64le-bootstrap.tbz /tmp/
cd /tmp/
tar -xvf go-linux-ppc64le-bootstrap.tbz
export GOROOT_BOOTSTRAP=/tmp/go-linux-ppc64le-bootstrap
mkdir -p /go/src/go.googlesource.com && cd /go/src/go.googlesource.com && git clone https://go.googlesource.com/go
cd /go/src/go.googlesource.com/go/
git checkout git checkout release-branch.go1.6
cd src/
./make.bash
cd

