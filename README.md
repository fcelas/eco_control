## EcoControl 🔋💡
## Mockup

![EcoCotrol](img/mockup.jpg)

## Visão Geral

EcoControl é um aplicativo móvel desenvolvido em Flutter projetado para ajudar usuários a monitorar e gerenciar seu consumo de energia. O aplicativo oferece ferramentas para calcular o consumo de energia de dispositivos, acompanhar o histórico de consumo e compreender os custos de eletricidade.

## Funcionalidades

- 📊 Calculadora de Consumo de Energia
- 🔌 Rastreamento de Consumo de Energia por Dispositivo
- 💾 Armazenamento Local de Dados de Consumo
- 🔹 Integração com Dispositivos Bluetooth

## Componentes Principais

### Modelos
- `consumo_energia`: Representa registros de consumo de energia com data, consumo e custo
- `dispositivo`: Define propriedades do dispositivo e calcula custos mensais de energia

### Serviços
- `servico_consumo`: Gerencia salvamento e recuperação de dados de consumo usando SharedPreferences
- `servico_bluetooth`: Lida com varredura de dispositivos Bluetooth, conexão e simulação de consumo de energia

### Telas
- Tela de Calculadora de Energia: Permite que os usuários insiram detalhes do dispositivo e calculem o consumo de energia
- Tela Inicial: Exibe o consumo de energia geral e lista de dispositivos

## Começando

### Pré-requisitos
- SDK do Flutter
- Dart
- Ambiente de desenvolvimento Android/iOS

### Instalação

1. Clone o repositório
```bash
git clone https://github.com/fcelas/eco_control.git
```

2. Instale as dependências
```bash
flutter pub get
```

3. Execute o aplicativo
```bash
flutter run
```

## Dependências
- `flutter_blue_plus`: Funcionalidade Bluetooth
- `shared_preferences`: Armazenamento local de dados
- `flutter`: SDK para desenvolvimento multiplataforma

## Telas e Funcionalidade

### Calculadora de Energia
- Insira nome do dispositivo, potência, horas de uso diário
- Calcule consumo mensal de energia e custo
- Mantenha uma lista de dispositivos rastreados

### Integração Bluetooth
- Varredura de dispositivos Bluetooth próximos
- Conexão com dispositivos de monitoramento de energia
- Simulação e transmissão de dados de consumo de energia

## Melhorias Futuras
- Implementar rastreamento em tempo real do consumo de energia
- Adicionar gráficos de visualização de dados
- Suportar múltiplas configurações de tarifa de energia
- Criar recursos de gerenciamento de dispositivos

# Arquitetura do EcoControl

## Visão Geral da Arquitetura

O EcoControl segue uma arquitetura limpa e modular, baseada no padrão de arquitetura BLoC (Business Logic Component) do Flutter, combinando princípios de Clean Architecture e separação de responsabilidades.

## Camadas da Arquitetura

### 1. Camada de Apresentação (Presentation Layer)
- **Responsabilidade**: Interface do usuário e gerenciamento de estado
- **Componentes**:
  - Telas:
    - `Home`: Visão geral do consumo de energia
    - `Calculador`: Calculadora de consumo de dispositivos
  - Widgets:
    - `Consumo`: Visualização gráfica de consumo
    - `Input Form`: Formulário de entrada de dispositivos

### 2. Camada de Negócio (Domain Layer)
- **Responsabilidade**: Regras de negócio e lógica central
- **Componentes**:
  - Modelos:
    - `Consumo Energia`: Entidade de consumo de energia
    - `Dispositivo`: Modelo de dispositivo
  - Casos de Uso:
    - `Calcula Consumo Dispositivo`: Cálculo de consumo de dispositivos
    - `Acompanha Consumo`: Acompanhamento de consumo

### 3. Camada de Dados (Data Layer)
- **Responsabilidade**: Persistência e fonte de dados

## Padrões de Projeto Utilizados

### State Management
- **BLoC (Business Logic Component)**: Gerenciamento de estado
- **Streams**: Para comunicação reativa
- **Provider/Riverpod**: Injeção de dependências

### Padrão Repository
- Abstração da fonte de dados
- Desacoplamento entre camadas de dados e negócio

### Padrão Adapter
- Conversão de dados entre camadas
- Transformação de modelos

## Fluxo de Dados

1. **Entrada de Dados**:
   - Usuário insere informações no `DeviceInputForm`
   - Dados passam pelo `EnergyCalculatorBloc`
   - Cálculos realizados nos casos de uso

2. **Persistência**:
   - Dados calculados salvos via `EnergyConsumptionService`
   - Utilização de `SharedPreferences` para armazenamento local

3. **Comunicação Bluetooth**:
   - `BluetoothService` gerencia conexão e leitura
   - Dados de consumo transmitidos via stream

## Princípios SOLID Aplicados

- **Single Responsibility**: Cada classe tem uma única responsabilidade
- **Open/Closed**: Extensível sem modificação
- **Dependency Inversion**: Depende de abstrações, não implementações

## Considerações de Segurança e Performance

- Tratamento de erros nas camadas de serviço
- Gerenciamento eficiente de recursos Bluetooth
- Armazenamento seguro de dados locais

## Tecnologias e Ferramentas

- **Linguagem**: Dart
- **Framework**: Flutter
- **Gerenciamento de Estado**: BLoC
- **Persistência**: SharedPreferences
- **Bluetooth**: flutter_blue_plus
- **Testes**: Unit e Widget tests

## Extensibilidade

A arquitetura permite:
- Adição fácil de novos dispositivos
- Implementação de diferentes fontes de dados
- Integração com serviços de energia externos

## Próximos Passos de Arquitetura

- Implementar injeção de dependência com GetIt
- Adicionar camada de cache
- Suporte a múltiplas plataformas
