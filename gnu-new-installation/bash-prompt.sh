
#!/bin/bash
# coding: utf-8

# Copyright 2020 Paulo Kretcheu <https://github.com/kretcheu/devel/>

#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU Lesser General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.

#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU Lesser General Public License for more details.

#    You should have received a copy of the GNU Lesser General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.

# Cores

COR[0]="\[\e[0m\]" # Normal
COR[1]="\[\e[1;31m\]" # Vermelho
COR[2]="\[\e[1;32m\]" # Verde
COR[3]="\[\e[1;33m\]" # Amarelo
COR[4]="\[\e[1;34m\]" # Azul
COR[5]="\[\e[1;35m\]" # Roxo
COR[6]="\[\e[1;36m\]" # Cian
COR[7]="\[\e[1;37m\]" # Branco
COR[8]="\[\e[1;96m\]" # Azul Claro

DES[0]="\342\224\214\342\224\200" # Linha de canto
DES[1]="\342\224\224\342\224\200\342\224\200\342\225\274" # Linha e ponto
DES[2]="\342\234\227" # Sinal de erro
DES[3]="\342\224\200" # Linha horizontal

lista=$1

if [ $# -eq 0 ]
then
   lista='1 2 3 4 5 6 7 8'
   orientacao="Usage: prompt [theme] [type]
   theme: define color theme. (1-8)
   type: define assets included. (1-4) "
fi

for i in $lista; do
# Definição do Tema
   case $i in
      1)
	COR_BASE=${COR[1]}
	COR_USER=${COR[3]}
	COR_ARROBA=${COR[7]}
	COR_SERVER=${COR[6]}
	COR_DIR=${COR[3]}
	COR_HORARIO=${COR[7]}
	COR_BATERIA=${COR[3]}
	COR_CURSOR=${COR[7]}
      ;;

      2)
	COR_BASE=${COR[5]}
	COR_USER=${COR[6]}
	COR_ARROBA=${COR[3]}
	COR_SERVER=${COR[4]}
	COR_DIR=${COR[2]}
	COR_HORARIO=${COR[7]}
	COR_BATERIA=${COR[7]}
	COR_CURSOR=${COR[1]}
      ;;

      3)
	COR_BASE=${COR[2]}
	COR_USER=${COR[6]}
	COR_ARROBA=${COR[3]}
	COR_SERVER=${COR[7]}
	COR_DIR=${COR[7]}
	COR_HORARIO=${COR[7]}
	COR_BATERIA=${COR[7]}
	COR_CURSOR=${COR[2]}
      ;;

      4)
	COR_BASE=${COR[3]}
	COR_USER=${COR[6]}
	COR_ARROBA=${COR[3]}
	COR_SERVER=${COR[7]}
	COR_DIR=${COR[7]}
	COR_HORARIO=${COR[7]}
	COR_BATERIA=${COR[7]}
	COR_CURSOR=${COR[2]}
      ;;

      5)
        COR_BASE=${COR[6]}
        COR_USER=${COR[6]}
        COR_ARROBA=${COR[3]}
        COR_SERVER=${COR[7]}
        COR_DIR=${COR[7]}
        COR_HORARIO=${COR[7]}
        COR_BATERIA=${COR[7]}
        COR_CURSOR=${COR[2]}
      ;;

      6)
        COR_BASE=${COR[4]}
        COR_USER=${COR[6]}
        COR_ARROBA=${COR[3]}
        COR_SERVER=${COR[7]}
        COR_DIR=${COR[3]}
        COR_HORARIO=${COR[7]}
        COR_BATERIA=${COR[7]}
        COR_CURSOR=${COR[2]}
      ;;

      7)
	COR_BASE=${COR[7]}
	COR_USER=${COR[3]}
	COR_ARROBA=${COR[7]}
	COR_SERVER=${COR[6]}
	COR_DIR=${COR[3]}
	COR_HORARIO=${COR[7]}
	COR_BATERIA=${COR[3]}
	COR_CURSOR=${COR[7]}
      ;;

      8)
	COR_BASE=${COR[7]}
	COR_USER=${COR[1]}
	COR_ARROBA=${COR[7]}
	COR_SERVER=${COR[1]}
	COR_DIR=${COR[1]}
	COR_HORARIO=${COR[1]}
	COR_BATERIA=${COR[1]}
	COR_CURSOR=${COR[7]}
      ;;

      *)
	COR_BASE=${COR[1]}
	COR_USER=${COR[3]}
	COR_ARROBA=${COR[7]}
	COR_SERVER=${COR[6]}
	COR_DIR=${COR[3]}
	COR_HORARIO=${COR[7]}
	COR_BATERIA=${COR[3]}
	COR_CURSOR=${COR[7]}
      ;;


   esac;

# Partes

ANTES="${COR_BASE}${DES[0]}"

MSG="${COR[3]}[${COR[1]}${DES[2]}${COR[3]}]${CORBASE}${DES[3]}"
#ERRO='$([[ $? != 0 ]] && echo "'${MSG}'")'

USER="${COR_USER}\u"
SERVER="${COR_SERVER}\h"
SEPARADOR="${COR_BASE}${DES[3]}"
DIR="${COR_DIR}\w"
HORARIO="${COR_HORARIO}\t"

DEVICE="$(upower -e | grep battery)"

ASPAS="'"
BATERIA='['${COR_BATERIA}'$(upower -i '$DEVICE' |grep percentage | rev | cut -c 1-3 |rev)'${COR_BASE}']'
DEPOIS="\n${COR_BASE}${DES[1]}"
CURSOR="${COR_CURSOR} "'\$'" "

LOADAVERAGE='['${COR_BATERIA}'$(cat /proc/loadavg | cut -d" " -f1-3)'${COR_BASE}']'

TYPE=${2}

case $TYPE in
   2) # Sem Bateria com Loadaverage
      PS1="${ANTES}${ERRO}${COR_BASE}[${USER}${COR_ARROBA}@${SERVER}${COR_BASE}]${SEPARADOR}${COR_BASE}[${DIR}${COR_BASE}]${SEPARADOR}[${HORARIO}${COR_BASE}]${SEPARADOR}${LOADAVERAGE}${DEPOIS}${CURSOR}${COR[0]}"
      ;;
   3) # Sem Bateria e sem Loadaverage
      PS1="${ANTES}${ERRO}${COR_BASE}[${USER}${COR_ARROBA}@${SERVER}${COR_BASE}]${SEPARADOR}${COR_BASE}[${DIR}${COR_BASE}]${SEPARADOR}[${HORARIO}${COR_BASE}]${DEPOIS}${CURSOR}${COR[0]}"
      ;;
   4) # Sem Bateria, sem loadaverage sem horário
      PS1="${ANTES}${ERRO}${COR_BASE}[${USER}${COR_ARROBA}@${SERVER}${COR_BASE}]${SEPARADOR}${COR_BASE}[${DIR}${COR_BASE}]${DEPOIS}${CURSOR}${COR[0]}"
      ;;
   1|*) # Com Bateria e Loadaverage
      PS1="${ANTES}${ERRO}${COR_BASE}[${USER}${COR_ARROBA}@${SERVER}${COR_BASE}]${SEPARADOR}${COR_BASE}[${DIR}${COR_BASE}]${SEPARADOR}[${HORARIO}${COR_BASE}]${SEPARADOR}${BATERIA}${SEPARADOR}${LOADAVERAGE}${DEPOIS}${CURSOR}${COR[0]}"
      ;;
esac

   if [ $# -gt 0 ]
   then
      echo
      echo "Pare ter essa aparência no terminal vai precisar substituir a definição da variável PS1."
      echo "Normalmente no arquivo ~/.bashrc ou para todos os usuários em /etc/bash.bashrc"
      echo
      echo "Testado em versões Buster e Sid do Debian, mas deve funcionar em muitas outras."
      echo
      echo "PS1='$PS1'"
      echo
   fi

   echo "--- Essa é a amostra do tema $i de como ficará o terminal ---------------------------------------------"
   echo
   printf '%s\n' "${PS1@P}"
   #echo "${PS1@P}"
   echo
done

echo "$orientacao"
echo
