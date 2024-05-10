FROM archlinux:latest

# Atualiza o sistema e instala o curl
RUN pacman -Syyu --noconfirm && \
    pacman -S curl --noconfirm

# Baixa e executa o script strap.sh do BlackArch
RUN curl -O https://blackarch.org/strap.sh && \
    chmod +x strap.sh && \
    ./strap.sh && \
    pacman -Syyu --noconfirm

# Limpa o cache do pacman para reduzir o tamanho da imagem final
RUN rm -rf /var/cache/pacman/pkg/*

# Define o comando padrão a ser executado quando o contêiner for iniciado
CMD ["/bin/bash"]