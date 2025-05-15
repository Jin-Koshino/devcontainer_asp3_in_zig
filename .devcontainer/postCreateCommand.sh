# install zig compiler(0.12.1)
cd /usr/share/
wget https://ziglang.org/download/0.12.1/zig-linux-x86_64-0.12.1.tar.xz
tar -xvf zig-linux-x86_64-0.12.1.tar.xz -C /usr/share
ln -s /usr/share/zig-linux-x86_64-0.12.1/zig /usr/bin/zig

# install zig language server(zls)
cd /usr/share
git clone https://github.com/zigtools/zls
cd zls
git checkout 0.12.0
zig build -Doptimize=ReleaseSafe

cd /usr/share
rm zig-linux-x86_64-0.12.1.tar.xz
exit