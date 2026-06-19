# Reduzir uma Partição LUKS com Btrfs

Neste guia, vamos abordar como diminuir o tamanho da sua partição no Linux de forma segura, focando no cenário de uso do sistema de arquivos **Btrfs** dentro de um volume criptografado com **LUKS**.

## ⚠️ Aviso

* Risco de perda de dados: Alterar partições e criptografia é uma operação crítica. Quedas de energia ou erros de digitação podem resultar em perda total dos dados.
* Faça backup: Salve todos os seus arquivos importantes em um armazenamento externo antes de iniciar.
* Use um Live USB: Este procedimento **não pode** ser feito com o sistema principal em execução. Você precisará dar boot por um pendrive com um Linux "Live" (ex: Ubuntu, Fedora, Arch).
* Siga a ordem: Execute os passos exatamente na ordem em que aparecem.

---

## 📚 Entendendo como a estrutura funciona

Nas configurações modernas com Btrfs sobre LUKS, a raiz (`/`) e os arquivos pessoais (`/home`) não ficam em partições físicas separadas. O sistema funciona em camadas:

1. Disco Físico: A partição real (ex: `/dev/sda3`).
2. Cofre LUKS: A camada de criptografia.
3. Sistema Btrfs: O sistema de arquivos interno.
4. Subvolumes: As pastas lógicas (como `/@` e `/@home`) que dividem o espaço dinamicamente.

Para reduzir o tamanho de forma segura, trabalhamos de dentro para fora:
```
+---------------+     +-------------------------+     +---------------------------------+
| Reduzir BtrFS | --> | Reduzir Partição Física | --> | Expandir BtrFS para Novo Limite |
+---------------+     +-------------------------+     +---------------------------------+
```

---

## 📝 Variáveis de Exemplo

Substitua estes valores pelos do seu próprio hardware (use `sudo fdisk -l` para confirmar):

* Alvo de Exemplo: `/dev/sda3`
* Setor Inicial `(First sector)`: `2101248` *(Atenção: Anote o seu número exato. Errar o setor inicial destrói a criptografia)*.
* Exemplo de Tamanho Final Desejado: `240G`
* Margem de Segurança do BtrFS: `230G`

---

## 🛠️ Passo a Passo (Via Live USB)

Após dar boot pelo Live USB, abra o terminal e execute os comandos abaixo.

### Passo 1: Abrir o cofre criptografado
Desbloqueie o disco para acessar o sistema de arquivos:
```bash
sudo cryptsetup open /dev/sda3 cryptroot
```
> (A sua senha de descriptografia será solicitada)

### 🐊 Passo 2: Montar o sistema Btrfs
O `Btrfs` exige estar montado em estado "on-line" para ser redimensionado:

```Bash
sudo mkdir -p /mnt/target
sudo mount /dev/mapper/cryptroot /mnt/target
```

### 🚀 Passo 3: Encolher o Btrfs com segurança
Reduza o sistema de arquivos para um tamanho menor do que o alvo final (ex: de 240G para 230G). Isso evita o corte de dados durante o redimensionamento físico:

```Bash
sudo btrfs filesystem resize 230G /mnt/target
```

### 🦊 Passo 4: Desmontar e fechar o contêiner
Libere o disco para possibilitar a edição da tabela de partições:

```Bash
sudo umount /mnt/target
sudo cryptsetup close cryptroot
```

### *️⃣ Passo 5: Redimensionar a partição física (fdisk)
Abra o utilitário de disco:

```Bash
sudo fdisk /dev/sda
```

Dentro do prompt interativo do `fdisk`, siga a sequência exata:

- Digite `p` e pressione `Enter` para listar as partições. Anote o setor inicial `(Start)` da partição alvo;
- Digite `d` e depois o número da partição (ex: 3) para deletá-la da tabela;
- Digite `n` e o número da partição (ex: 3) para recriá-la;
- Em `First sector`, digite exatamente o seu setor inicial original (ex: `2101248`);
- Em `Last sector`, digite o novo tamanho desejado: `+240G`;
> 🚨 **Atenção**: O `fdisk` perguntará se deseja remover a assinatura LUKS (`Do you want to remove the signature? [Y]es/[N]o:`). Digite `N` (Não). Confirmar a remoção destruirá seus dados de forma irreversível.
- Digite `w` para gravar as alterações e sair.

### 🌕 Passo 6: Expandir o Btrfs para o limite físico
Reabra o cofre e faça o Btrfs ocupar perfeitamente o novo limite de 240 GB:

```Bash
# Abrir o cofre LUKS
sudo cryptsetup open /dev/sda3 cryptroot

# Montar o Btrfs
sudo mount /dev/mapper/cryptroot /mnt/target

# Expandir para o máximo da nova partição
sudo btrfs filesystem resize max /mnt/target
```

### 🐧 Passo 7: Finalização
Desmonte o sistema com segurança antes de reiniciar:

```Bash
sudo umount /mnt/target
sudo cryptsetup close cryptroot
sudo reboot
```
