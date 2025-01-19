FROM mcr.microsoft.com/devcontainers/base:jammy
WORKDIR /usr/share

RUN wget https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2020q2/gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2
RUN wget https://ziglang.org/download/0.11.0/zig-linux-x86_64-0.11.0.tar.xz
RUN apt-get update && apt-get install -y git qemu-system-arm rbenv libssl-dev libreadline-dev zlib1g-dev \
    && tar -xvf gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 -C /usr/share \
    && tar -xvf zig-linux-x86_64-0.11.0.tar.xz -C /usr/share \
    && ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-gcc /usr/bin/arm-none-eabi-gcc \
    && ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-objcopy /usr/bin/arm-none-eabi-objcopy \
    && ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-nm /usr/bin/arm-none-eabi-nm \
    && ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-ar /usr/bin/arm-none-eabi-ar \
    && ln -s /usr/share/gcc-arm-none-eabi-9-2020-q2-update/bin/arm-none-eabi-ranlib /usr/bin/arm-none-eabi-ranlib \
    && ln -s /usr/share/zig-linux-x86_64-0.11.0/zig /usr/bin/zig \
    && rm gcc-arm-none-eabi-9-2020-q2-update-x86_64-linux.tar.bz2 \
    && rm zig-linux-x86_64-0.11.0.tar.xz 
    
WORKDIR /home/vscode
RUN echo 'export PATH="/home/.rbenv/bin:$PATH"' >> .bashrc \
    && echo 'eval "$(rbenv init -)"' >> .bashrc \
    && git clone https://github.com/rbenv/ruby-build.git .rbenv/plugins/ruby-build \
    && chown -R vscode:vscode /home/vscode/.rbenv \
    && chmod -R 755 /home/vscode/.rbenv
    
USER vscode
RUN /bin/bash -c "source .bashrc && rbenv install 2.6.3 && rbenv global 2.6.3"