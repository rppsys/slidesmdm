# coding=utf-8

import re
import os
from os import listdir
from os.path import isfile, join, splitext

strSep = os.path.sep
strPathDir = "/home/ronie/proj/WORK/al/features"
strOutputFullFilename = strPathDir  + strSep + "output.txt"

listAllFiles = [f for f in listdir(strPathDir) if isfile(join(strPathDir, f))]
lF = []
for strFile in listAllFiles:
    filename, file_extension = os.path.splitext(strFile)
    if file_extension == '.feature':
        lF.append(strFile)
lF.sort()

def retListCenarios(strFilename):
    listRet = []
    with open(strFilename) as filePS:
        srcEPE = filePS.read()

    a = re.finditer('Cenário.*',srcEPE)
    ll = []
    for m in a:
        ll.append(m)

    listRet.append('\\textbf{' + strFilename.replace('_','\_') + '}')
    listRet.append('\\begin{itemize}')

    countLine = 0
    for l in ll:
        string_to_search = l.group(0)
        with open(strFilename, 'r') as read_obj:
            line_number = 0
            for line in read_obj:
                line_number += 1
                if string_to_search in line:
                    countLine += 1
                    novaLinha = line.strip('\n')
                    novaLinha = novaLinha.lstrip()
                    novaLinha = novaLinha.replace('" ',"'' ").replace(' "',' ``').replace('“','``').replace('”',"''").replace('"',"''")
                    listRet.append('     \item {} - {} (linha {})'.format(countLine,novaLinha,line_number))


    if len(listRet) == 2:
        listRet.append('     \item Não há cenários!')
    listRet.append('\\end{itemize}')
    listRet.append('')
    listRet.append('')
    return listRet

def criaComandos(strFilename,strPrefixo,numF):
    listRet = []
    with open(strFilename) as filePS:
        srcEPE = filePS.read()

    a = re.finditer('Cenário.*',srcEPE)
    ll = []
    for m in a:
        ll.append(m)

    strF = strFilename.replace('_','\_')
    strC = '\\{}F{}'.format(strPrefixo,numF)
    strC = strC.replace('0','z').replace('1','u').replace('2','d').replace('3','t').replace('4','q').replace('5','c').replace('6','s').replace('7','e').replace('8','o').replace('9','n')
    listRet.append('\\newcommand{' + strC + '}{' + strF + '}')


    countLine = 0
    for l in ll:
        string_to_search = l.group(0)
        with open(strFilename, 'r') as read_obj:
            line_number = 0
            for line in read_obj:
                line_number += 1
                if string_to_search in line:
                    novaLinha = line.strip('\n')
                    novaLinha = novaLinha.replace('" ',"'' ").replace(' "',' ``').replace('“','``').replace('”',"''").replace('"',"''")
                    novaLinha = novaLinha.lstrip()
                    countLine += 1
                    strCmd = '\\{}F{}C{}'.format(strPrefixo,numF,countLine)
                    strCmd = strCmd.replace('0','z').replace('1','u').replace('2','d').replace('3','t').replace('4','q').replace('5','c').replace('6','s').replace('7','e').replace('8','o').replace('9','n')
                    listRet.append('\\newcommand{' + strCmd + '}{' + novaLinha + ' (linha {})'.format(line_number) + '}')
    return listRet

####################
  # EXPORTA TEXTO
####################

# Limpa Arquivo
strF = ''
with open(strOutputFullFilename, 'w') as fileOutput:
    fileOutput.write(strF)

# Adiciona Comandos
c = 0
for f in lF:
    c += 1
    retL = criaComandos(f,'sos',c)
    strF = '\n'.join(retL)
    strF = strF + '\n\n'
    with open(strOutputFullFilename, 'a') as fileOutput:
        fileOutput.write(strF)

# Pula Linha
with open(strOutputFullFilename, 'a') as fileOutput:
    fileOutput.write('\n')

# Adiciona Texto
for f in lF:
    retL = retListCenarios(f)
    strF = '\n'.join(retL)
    with open(strOutputFullFilename, 'a') as fileOutput:
        fileOutput.write(strF)
