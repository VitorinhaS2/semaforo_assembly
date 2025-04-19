# Semáforo com PIC16F877A em Assembly

Este projeto simula o funcionamento de um semáforo utilizando o microcontrolador PIC16F877A programado em linguagem Assembly. A simulação foi realizada com o ambiente **MPLAB IDE** e testada na plataforma **PICgenios**.

## Funcionalidades

- Controle de três LEDs (vermelho, amarelo e verde) representando um semáforo.
- Temporização padrão de 3 segundos por cor.
- Entrada por botão (RB0) que altera o modo para "teste rápido", com trocas a cada 50 microssegundos.
- Código escrito 100% em Assembly.

## Objetivo

Demonstrar o controle de sinais com tempo variável utilizando entradas digitais e lógica de atraso baseada em software, sem o uso de temporizadores internos.

## Materias utilizados

- MPLAB IDE;
- Simulador PICgenios.

## Conexões

- **PORTD.0**: LED Verde  
- **PORTD.1**: LED Amarelo  
- **PORTD.2**: LED Vermelho  
- **PORTB.0**: Botão de controle

## Lógica de Funcionamento

1. O sistema inicia com a sequência: vermelho → verde → amarelo.
2. Cada cor permanece acesa por ~3 segundos.
3. Ao pressionar o botão conectado a RB0, o tempo de cada cor muda para ~50 μs, simulando um modo rápido de teste.
4. Ao soltar o botão, o sistema retorna ao modo normal.

## Arquivos

- `semaforo2.0.asm`: Código-fonte principal em Assembly
- `README.md`: Este arquivo de descrição

## Link do vídeo da simulação
 
https://www.canva.com/design/DAGlHLD7tSE/v2PHIopBPKHNgU-jExurag/watch?utm_content=DAGlHLD7tSE&utm_campaign=designshare&utm_medium=link2&utm_source=uniquelinks&utlId=hf33ec990d6

> Imagem ou gif da simulação no PICgenios (opcional, mas recomendável)

