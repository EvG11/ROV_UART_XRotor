#define TRUE 1
#define FALSE 0

#define MS5803_CMD_RESET      (0x1E)   // ADC reset command
#define MS5803_CMD_ADC_READ   (0x00)   // ADC read command
#define MS5803_CMD_ADC_CONV   (0x40)   // ADC conversion command
#define MS5803_CMD_ADC_D1     (0x00)   // ADC D1 conversion
#define MS5803_CMD_ADC_D2     (0x10)   // ADC D2 conversion
#define MS5803_CMD_ADC_256    (0x00)   // ADC OSR=256
#define MS5803_CMD_ADC_512    (0x02)   // ADC OSR=512
#define MS5803_CMD_ADC_1024   (0x04)   // ADC OSR=1024
#define MS5803_CMD_ADC_2048   (0x06)   // ADC OSR=2056
#define MS5803_CMD_ADC_4096   (0x08)   // ADC OSR=4096
#define MS5803_CMD_PROM_RD    (0xA0)   // Prom read command

#define MS5803_I2C_ADDRESS    (0x77)   // If the CSB Pin (pin 3) is high, then the address is 0x76, if low, then it's 0x77