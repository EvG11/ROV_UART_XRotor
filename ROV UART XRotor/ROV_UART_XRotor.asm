_Init_MCU:
;ROV_UART_XRotor.c,157 :: 		void Init_MCU(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,158 :: 		GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_11);
MOVW	R1, #2048
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;ROV_UART_XRotor.c,163 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI2_PB13_14_15+0)
;ROV_UART_XRotor.c,162 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
MOVW	R1, #773
;ROV_UART_XRotor.c,160 :: 		SPI2_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #3
;ROV_UART_XRotor.c,163 :: 		&_GPIO_MODULE_SPI2_PB13_14_15);
BL	_SPI2_Init_Advanced+0
;ROV_UART_XRotor.c,165 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_init_LEVI:
;ROV_UART_XRotor.c,192 :: 		void init_LEVI()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,194 :: 		pwm_period = PWM_TIM4_Init(50);
MOVS	R0, #50
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV_UART_XRotor.c,195 :: 		PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PB9+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;ROV_UART_XRotor.c,197 :: 		}
L_end_init_LEVI:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_LEVI
_init_DESNI:
;ROV_UART_XRotor.c,202 :: 		void init_DESNI()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,204 :: 		pwm_period = PWM_TIM3_Init(50);
MOVS	R0, #50
BL	_PWM_TIM3_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV_UART_XRotor.c,205 :: 		PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM3_CH3_PB0+0)
MOVS	R0, #2
BL	_PWM_TIM3_Start+0
;ROV_UART_XRotor.c,207 :: 		}
L_end_init_DESNI:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_DESNI
_init_THRUSTER:
;ROV_UART_XRotor.c,212 :: 		void init_THRUSTER()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,214 :: 		pwm_period = PWM_TIM4_Init(50);
MOVS	R0, #50
BL	_PWM_TIM4_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV_UART_XRotor.c,215 :: 		PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PB8+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;ROV_UART_XRotor.c,217 :: 		}
L_end_init_THRUSTER:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_THRUSTER
_init_SVETLO:
;ROV_UART_XRotor.c,221 :: 		void init_SVETLO()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,223 :: 		pwm_period = PWM_TIM9_Init(50);
MOVS	R0, #50
BL	_PWM_TIM9_Init+0
MOVW	R1, #lo_addr(_pwm_period+0)
MOVT	R1, #hi_addr(_pwm_period+0)
STRH	R0, [R1, #0]
;ROV_UART_XRotor.c,224 :: 		PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM9_CH1_PE5+0)
MOVS	R0, #0
BL	_PWM_TIM9_Start+0
;ROV_UART_XRotor.c,226 :: 		}
L_end_init_SVETLO:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_SVETLO
_Napred:
;ROV_UART_XRotor.c,238 :: 		void Napred(){
;ROV_UART_XRotor.c,240 :: 		LEVI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,242 :: 		DESNI=NAPRED;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,244 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,245 :: 		}
L_end_Napred:
BX	LR
; end of _Napred
_Nazad:
;ROV_UART_XRotor.c,249 :: 		void Nazad(){
;ROV_UART_XRotor.c,251 :: 		LEVI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,253 :: 		DESNI=NAZAD;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,255 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,257 :: 		}
L_end_Nazad:
BX	LR
; end of _Nazad
_Levo:
;ROV_UART_XRotor.c,261 :: 		void Levo(){
;ROV_UART_XRotor.c,263 :: 		LEVI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,265 :: 		DESNI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,267 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,269 :: 		}
L_end_Levo:
BX	LR
; end of _Levo
_Desno:
;ROV_UART_XRotor.c,273 :: 		void Desno(){
;ROV_UART_XRotor.c,275 :: 		LEVI=DESNO;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,277 :: 		DESNI=LEVO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,279 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,281 :: 		}
L_end_Desno:
BX	LR
; end of _Desno
_Zaron:
;ROV_UART_XRotor.c,285 :: 		void Zaron(){
;ROV_UART_XRotor.c,287 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,289 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,291 :: 		THRUSTER=ZARON;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,293 :: 		}
L_end_Zaron:
BX	LR
; end of _Zaron
_Izron:
;ROV_UART_XRotor.c,297 :: 		void Izron(){
;ROV_UART_XRotor.c,299 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,301 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,303 :: 		THRUSTER=IZRON;
MOVW	R1, #2310
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,305 :: 		}
L_end_Izron:
BX	LR
; end of _Izron
_Stop:
;ROV_UART_XRotor.c,309 :: 		void Stop(){
;ROV_UART_XRotor.c,311 :: 		LEVI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,313 :: 		DESNI=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,315 :: 		THRUSTER=STOP;
MOVW	R1, #2453
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,317 :: 		}
L_end_Stop:
BX	LR
; end of _Stop
_Svetlo_ON:
;ROV_UART_XRotor.c,322 :: 		void Svetlo_ON() {
;ROV_UART_XRotor.c,324 :: 		SVETLO = UKLJUCENO;
MOVW	R1, #2650
MOVW	R0, #lo_addr(_SVETLO+0)
MOVT	R0, #hi_addr(_SVETLO+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,326 :: 		}
L_end_Svetlo_ON:
BX	LR
; end of _Svetlo_ON
_Svetlo_OFF:
;ROV_UART_XRotor.c,330 :: 		void Svetlo_OFF(){
;ROV_UART_XRotor.c,332 :: 		SVETLO = ISKLJUCENO;
MOVS	R1, #0
MOVW	R0, #lo_addr(_SVETLO+0)
MOVT	R0, #hi_addr(_SVETLO+0)
STRH	R1, [R0, #0]
;ROV_UART_XRotor.c,334 :: 		}
L_end_Svetlo_OFF:
BX	LR
; end of _Svetlo_OFF
_MSS5803_Reset:
;ROV_UART_XRotor.c,345 :: 		void MSS5803_Reset(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,346 :: 		Chip_Select = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;ROV_UART_XRotor.c,347 :: 		SPI2_Write(MS5803_CMD_RESET);
MOVS	R0, #30
BL	_SPI2_Write+0
;ROV_UART_XRotor.c,348 :: 		Delay_ms(5);
MOVW	R7, #53390
MOVT	R7, #3
NOP
NOP
L_MSS5803_Reset0:
SUBS	R7, R7, #1
BNE	L_MSS5803_Reset0
NOP
NOP
NOP
;ROV_UART_XRotor.c,349 :: 		Chip_Select = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;ROV_UART_XRotor.c,350 :: 		}
L_end_MSS5803_Reset:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MSS5803_Reset
_Read_MSS5803_ReadCoefficient:
;ROV_UART_XRotor.c,353 :: 		unsigned Read_MSS5803_ReadCoefficient(char index){
; index start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; index end address is: 0 (R0)
; index start address is: 0 (R0)
;ROV_UART_XRotor.c,354 :: 		unsigned int result = 0;
;ROV_UART_XRotor.c,355 :: 		Chip_Select = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV_UART_XRotor.c,356 :: 		SPI2_Read(MS5803_CMD_PROM_RD + (index*2));
LSLS	R1, R0, #1
SXTH	R1, R1
; index end address is: 0 (R0)
ADDS	R1, #160
UXTH	R0, R1
BL	_SPI2_Read+0
;ROV_UART_XRotor.c,357 :: 		result=SPI2_read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
;ROV_UART_XRotor.c,358 :: 		result=result << 8;
LSLS	R1, R0, #8
; result start address is: 16 (R4)
UXTH	R4, R1
;ROV_UART_XRotor.c,359 :: 		result |= SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
ORR	R3, R4, R0, LSL #0
; result end address is: 16 (R4)
;ROV_UART_XRotor.c,360 :: 		Chip_Select = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV_UART_XRotor.c,362 :: 		return result;
UXTH	R0, R3
;ROV_UART_XRotor.c,363 :: 		}
L_end_Read_MSS5803_ReadCoefficient:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Read_MSS5803_ReadCoefficient
_MS5803_CRC4:
;ROV_UART_XRotor.c,368 :: 		char MS5803_CRC4(unsigned int n_prom[]){
; n_rem start address is: 0 (R0)
;ROV_UART_XRotor.c,374 :: 		n_rem = 0x00;
MOVS	R0, #0
;ROV_UART_XRotor.c,375 :: 		crc_read = sensorCoefficients[7];
MOVW	R2, #lo_addr(ROV_UART_XRotor_sensorCoefficients+14)
MOVT	R2, #hi_addr(ROV_UART_XRotor_sensorCoefficients+14)
; crc_read start address is: 12 (R3)
LDRH	R3, [R2, #0]
;ROV_UART_XRotor.c,376 :: 		sensorCoefficients[7] = ( 0xFF00 & ( sensorCoefficients[7] ) );
MOV	R1, R2
LDRH	R1, [R1, #0]
AND	R1, R1, #65280
STRH	R1, [R2, #0]
;ROV_UART_XRotor.c,377 :: 		for (cnt = 0; cnt < 16; cnt++) {
; cnt start address is: 4 (R1)
MOVS	R1, #0
SXTH	R1, R1
; n_rem end address is: 0 (R0)
; cnt end address is: 4 (R1)
; crc_read end address is: 12 (R3)
UXTH	R4, R0
SXTH	R0, R1
L_MS5803_CRC42:
; cnt start address is: 0 (R0)
; crc_read start address is: 12 (R3)
; n_rem start address is: 16 (R4)
CMP	R0, #16
IT	GE
BGE	L_MS5803_CRC43
;ROV_UART_XRotor.c,379 :: 		if ( cnt%2 == 1 ) n_rem ^= (unsigned short) ( ( sensorCoefficients[cnt>>1] ) & 0x00FF );
MOVS	R2, #2
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
CMP	R1, #1
IT	NE
BNE	L_MS5803_CRC45
ASRS	R1, R0, #1
SXTH	R1, R1
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(ROV_UART_XRotor_sensorCoefficients+0)
MOVT	R1, #hi_addr(ROV_UART_XRotor_sensorCoefficients+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
AND	R1, R1, #255
UXTB	R1, R1
EORS	R4, R1
UXTH	R4, R4
IT	AL
BAL	L_MS5803_CRC46
L_MS5803_CRC45:
;ROV_UART_XRotor.c,381 :: 		else n_rem ^= (unsigned short) ( sensorCoefficients[cnt>>1] >> 8 );
ASRS	R1, R0, #1
SXTH	R1, R1
LSLS	R2, R1, #1
MOVW	R1, #lo_addr(ROV_UART_XRotor_sensorCoefficients+0)
MOVT	R1, #hi_addr(ROV_UART_XRotor_sensorCoefficients+0)
ADDS	R1, R1, R2
LDRH	R1, [R1, #0]
LSRS	R1, R1, #8
UXTB	R1, R1
EOR	R1, R4, R1, LSL #0
; n_rem end address is: 16 (R4)
; n_rem start address is: 8 (R2)
UXTH	R2, R1
; n_rem end address is: 8 (R2)
UXTH	R4, R2
L_MS5803_CRC46:
;ROV_UART_XRotor.c,382 :: 		for ( n_bit = 8; n_bit > 0; n_bit-- ) {
; n_rem start address is: 16 (R4)
; n_bit start address is: 8 (R2)
MOVS	R2, #8
; crc_read end address is: 12 (R3)
; n_rem end address is: 16 (R4)
; n_bit end address is: 8 (R2)
; cnt end address is: 0 (R0)
L_MS5803_CRC47:
; n_bit start address is: 8 (R2)
; n_rem start address is: 16 (R4)
; crc_read start address is: 12 (R3)
; cnt start address is: 0 (R0)
CMP	R2, #0
IT	LS
BLS	L_MS5803_CRC48
;ROV_UART_XRotor.c,383 :: 		if ( n_rem & ( 0x8000 ) ) {
AND	R1, R4, #32768
UXTH	R1, R1
CMP	R1, #0
IT	EQ
BEQ	L_MS5803_CRC410
;ROV_UART_XRotor.c,384 :: 		n_rem = ( n_rem << 1 ) ^ 0x3000;
LSLS	R4, R4, #1
UXTH	R4, R4
; n_rem end address is: 16 (R4)
EOR	R4, R4, #12288
UXTH	R4, R4
; n_rem start address is: 16 (R4)
;ROV_UART_XRotor.c,385 :: 		}
IT	AL
BAL	L_MS5803_CRC411
L_MS5803_CRC410:
;ROV_UART_XRotor.c,387 :: 		n_rem = ( n_rem << 1 );
LSLS	R4, R4, #1
UXTH	R4, R4
; n_rem end address is: 16 (R4)
;ROV_UART_XRotor.c,388 :: 		}
L_MS5803_CRC411:
;ROV_UART_XRotor.c,382 :: 		for ( n_bit = 8; n_bit > 0; n_bit-- ) {
; n_rem start address is: 16 (R4)
SUBS	R2, R2, #1
UXTB	R2, R2
;ROV_UART_XRotor.c,389 :: 		}
; n_bit end address is: 8 (R2)
IT	AL
BAL	L_MS5803_CRC47
L_MS5803_CRC48:
;ROV_UART_XRotor.c,377 :: 		for (cnt = 0; cnt < 16; cnt++) {
ADDS	R0, R0, #1
SXTH	R0, R0
;ROV_UART_XRotor.c,390 :: 		}
; cnt end address is: 0 (R0)
IT	AL
BAL	L_MS5803_CRC42
L_MS5803_CRC43:
;ROV_UART_XRotor.c,391 :: 		n_rem = ( 0x000F & ( n_rem >> 12 ) );
LSRS	R1, R4, #12
UXTH	R1, R1
; n_rem end address is: 16 (R4)
AND	R2, R1, #15
;ROV_UART_XRotor.c,392 :: 		sensorCoefficients[7] = crc_read;
MOVW	R1, #lo_addr(ROV_UART_XRotor_sensorCoefficients+14)
MOVT	R1, #hi_addr(ROV_UART_XRotor_sensorCoefficients+14)
STRH	R3, [R1, #0]
; crc_read end address is: 12 (R3)
;ROV_UART_XRotor.c,394 :: 		return ( n_rem ^ 0x00 );
UXTB	R0, R2
;ROV_UART_XRotor.c,395 :: 		}
L_end_MS5803_CRC4:
BX	LR
; end of _MS5803_CRC4
_MS5803_Cmd_Adc:
;ROV_UART_XRotor.c,399 :: 		unsigned long MS5803_Cmd_Adc(char cmd){
; cmd start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R4, R0
; cmd end address is: 0 (R0)
; cmd start address is: 16 (R4)
;ROV_UART_XRotor.c,400 :: 		unsigned long result = 0;
;ROV_UART_XRotor.c,401 :: 		unsigned long returnedData = 0;
;ROV_UART_XRotor.c,403 :: 		Chip_Select=0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV_UART_XRotor.c,404 :: 		SPI2_Write(MS5803_CMD_ADC_CONV + cmd);
ADDW	R1, R4, #64
UXTH	R0, R1
BL	_SPI2_Write+0
;ROV_UART_XRotor.c,405 :: 		switch (cmd & 0x0f) {
AND	R1, R4, #15
UXTB	R1, R1
; cmd end address is: 16 (R4)
IT	AL
BAL	L_MS5803_Cmd_Adc12
;ROV_UART_XRotor.c,406 :: 		case MS5803_CMD_ADC_256 : Delay_us(900); break;
L_MS5803_Cmd_Adc14:
MOVW	R7, #44998
MOVT	R7, #0
NOP
NOP
L_MS5803_Cmd_Adc15:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc15
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV_UART_XRotor.c,407 :: 		case MS5803_CMD_ADC_512 : Delay_ms(3);   break;
L_MS5803_Cmd_Adc17:
MOVW	R7, #18926
MOVT	R7, #2
NOP
NOP
L_MS5803_Cmd_Adc18:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc18
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV_UART_XRotor.c,408 :: 		case MS5803_CMD_ADC_1024: Delay_ms(4);   break;
L_MS5803_Cmd_Adc20:
MOVW	R7, #3390
MOVT	R7, #3
NOP
NOP
L_MS5803_Cmd_Adc21:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc21
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV_UART_XRotor.c,409 :: 		case MS5803_CMD_ADC_2048: Delay_ms(8);   break;
L_MS5803_Cmd_Adc23:
MOVW	R7, #6782
MOVT	R7, #6
NOP
NOP
L_MS5803_Cmd_Adc24:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc24
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV_UART_XRotor.c,410 :: 		case MS5803_CMD_ADC_4096: Delay_ms(14);  break;
L_MS5803_Cmd_Adc26:
MOVW	R7, #44638
MOVT	R7, #10
NOP
NOP
L_MS5803_Cmd_Adc27:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc27
NOP
NOP
NOP
IT	AL
BAL	L_MS5803_Cmd_Adc13
;ROV_UART_XRotor.c,411 :: 		}
L_MS5803_Cmd_Adc12:
CMP	R1, #0
IT	EQ
BEQ	L_MS5803_Cmd_Adc14
CMP	R1, #2
IT	EQ
BEQ	L_MS5803_Cmd_Adc17
CMP	R1, #4
IT	EQ
BEQ	L_MS5803_Cmd_Adc20
CMP	R1, #6
IT	EQ
BEQ	L_MS5803_Cmd_Adc23
CMP	R1, #8
IT	EQ
BEQ	L_MS5803_Cmd_Adc26
L_MS5803_Cmd_Adc13:
;ROV_UART_XRotor.c,412 :: 		Chip_Select = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV_UART_XRotor.c,413 :: 		Delay_ms(3);
MOVW	R7, #18926
MOVT	R7, #2
NOP
NOP
L_MS5803_Cmd_Adc29:
SUBS	R7, R7, #1
BNE	L_MS5803_Cmd_Adc29
NOP
NOP
NOP
;ROV_UART_XRotor.c,414 :: 		Chip_Select = 0;
MOVS	R2, #0
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV_UART_XRotor.c,415 :: 		SPI2_Read(MS5803_CMD_ADC_READ);
MOVS	R0, #0
BL	_SPI2_Read+0
;ROV_UART_XRotor.c,416 :: 		returnedData = SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
; returnedData start address is: 0 (R0)
;ROV_UART_XRotor.c,417 :: 		result = (returnedData << 16);
LSLS	R4, R0, #16
; returnedData end address is: 0 (R0)
; result start address is: 16 (R4)
;ROV_UART_XRotor.c,418 :: 		returnedData = SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
; returnedData start address is: 0 (R0)
;ROV_UART_XRotor.c,419 :: 		result = result + (returnedData << 8);
LSLS	R1, R0, #8
; returnedData end address is: 0 (R0)
ADDS	R4, R4, R1
;ROV_UART_XRotor.c,420 :: 		returnedData = SPI2_Read(0x00);
MOVS	R0, #0
BL	_SPI2_Read+0
; returnedData start address is: 0 (R0)
;ROV_UART_XRotor.c,421 :: 		result = result + returnedData;
ADDS	R3, R4, R0
; result end address is: 16 (R4)
; returnedData end address is: 0 (R0)
;ROV_UART_XRotor.c,422 :: 		Chip_Select = 1;
MOVS	R2, #1
SXTB	R2, R2
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;ROV_UART_XRotor.c,424 :: 		return result;
MOV	R0, R3
;ROV_UART_XRotor.c,425 :: 		}
L_end_MS5803_Cmd_Adc:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _MS5803_Cmd_Adc
_MS5803_Init:
;ROV_UART_XRotor.c,429 :: 		char MS5803_Init() {
SUB	SP, SP, #8
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,431 :: 		int i = 0;
;ROV_UART_XRotor.c,432 :: 		MSS5803_Reset();
BL	_MSS5803_Reset+0
;ROV_UART_XRotor.c,433 :: 		for ( i = 0; i < 8; i++ ){
; i start address is: 20 (R5)
MOVS	R5, #0
SXTH	R5, R5
; i end address is: 20 (R5)
L_MS5803_Init31:
; i start address is: 20 (R5)
CMP	R5, #8
IT	GE
BGE	L_MS5803_Init32
;ROV_UART_XRotor.c,434 :: 		sensorCoefficients[ i ] = Read_MSS5803_ReadCoefficient( i );
LSLS	R1, R5, #1
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+0)
ADDS	R0, R0, R1
STR	R0, [SP, #4]
UXTB	R0, R5
BL	_Read_MSS5803_ReadCoefficient+0
LDR	R1, [SP, #4]
STRH	R0, [R1, #0]
;ROV_UART_XRotor.c,433 :: 		for ( i = 0; i < 8; i++ ){
ADDS	R5, R5, #1
SXTH	R5, R5
;ROV_UART_XRotor.c,435 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_MS5803_Init31
L_MS5803_Init32:
;ROV_UART_XRotor.c,436 :: 		p_crc = sensorCoefficients[ 7 ];
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+14)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+14)
; p_crc start address is: 20 (R5)
LDRH	R5, [R0, #0]
;ROV_UART_XRotor.c,437 :: 		n_crc = MS5803_CRC4( sensorCoefficients );
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+0)
BL	_MS5803_CRC4+0
; n_crc start address is: 0 (R0)
;ROV_UART_XRotor.c,440 :: 		asm nop
NOP
;ROV_UART_XRotor.c,444 :: 		if(p_crc!=n_crc){
CMP	R5, R0
IT	EQ
BEQ	L_MS5803_Init34
; p_crc end address is: 20 (R5)
; n_crc end address is: 0 (R0)
;ROV_UART_XRotor.c,445 :: 		return FALSE;
MOVS	R0, #0
IT	AL
BAL	L_end_MS5803_Init
;ROV_UART_XRotor.c,446 :: 		}
L_MS5803_Init34:
;ROV_UART_XRotor.c,448 :: 		return TRUE;
MOVS	R0, #1
;ROV_UART_XRotor.c,450 :: 		}
L_end_MS5803_Init:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _MS5803_Init
_MS5803_Read_Sensor:
;ROV_UART_XRotor.c,454 :: 		void MS5803_Read_Sensor() {
SUB	SP, SP, #24
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,455 :: 		q1 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D1 + MS5803_CMD_ADC_4096);
MOVS	R0, #8
BL	_MS5803_Cmd_Adc+0
MOVW	R1, #lo_addr(ROV_UART_XRotor_q1+0)
MOVT	R1, #hi_addr(ROV_UART_XRotor_q1+0)
STR	R1, [SP, #20]
STR	R0, [R1, #0]
;ROV_UART_XRotor.c,456 :: 		q2 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D2 + MS5803_CMD_ADC_4096);
MOVS	R0, #24
BL	_MS5803_Cmd_Adc+0
MOVW	R1, #lo_addr(ROV_UART_XRotor_q2+0)
MOVT	R1, #hi_addr(ROV_UART_XRotor_q2+0)
STR	R0, [R1, #0]
;ROV_UART_XRotor.c,459 :: 		asm nop
NOP
;ROV_UART_XRotor.c,462 :: 		deltaTemp = q2 - sensorCoefficients[5] * pow( 2, 8 );
VMOV.F32	S1, #8
VMOV.F32	S0, #2
BL	_pow+0
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+10)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+10)
LDRH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMUL.F32	S1, S1, S0
MOVW	R0, #lo_addr(ROV_UART_XRotor_q2+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_q2+0)
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S0, S0
VSUB.F32	S0, S0, S1
VMOV	R0, S0
BL	__FloatToSignedLongLong+0
MOVW	R2, #lo_addr(_deltaTemp+0)
MOVT	R2, #hi_addr(_deltaTemp+0)
STR	R2, [SP, #16]
STRD	R0, R1, [R2, #0]
;ROV_UART_XRotor.c,463 :: 		sensorOffset = sensorCoefficients[2] * pow( 2, 16 ) + ( (long long)deltaTemp * sensorCoefficients[4] ) / pow( 2, 7 );
VMOV.F32	S1, #16
VMOV.F32	S0, #2
BL	_pow+0
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+4)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+4)
LDRH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [SP, #12]
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+8)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+8)
LDRH	R4, [R0, #0]
MOVS	R5, #0
MOVW	R0, #lo_addr(_deltaTemp+0)
MOVT	R0, #hi_addr(_deltaTemp+0)
LDRD	R2, R3, [R0, #0]
UMULL	R0, R1, R2, R4
MLA	R1, R3, R4, R1
MLA	R1, R2, R5, R1
STRD	R0, R1, [SP, #4]
VMOV.F32	S1, #7
VMOV.F32	S0, #2
BL	_pow+0
LDRD	R0, R1, [SP, #4]
VSTR	#1, S0, [SP, #4]
BL	__SignedLongLongToFloat+0
VMOV	S0, R0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S0, S1
VLDR	#1, S0, [SP, #12]
VADD.F32	S0, S0, S1
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorOffset+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorOffset+0)
VSTR	#1, S0, [R0, #0]
;ROV_UART_XRotor.c,464 :: 		sensitivity = sensorCoefficients[1] * pow( 2, 15 ) + ( (long long)deltaTemp * sensorCoefficients[3] ) / pow( 2, 8 );
VMOV.F32	S1, #15
VMOV.F32	S0, #2
BL	_pow+0
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+2)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+2)
LDRH	R0, [R0, #0]
VMOV	S1, R0
VCVT.F32	#0, S1, S1
VMUL.F32	S0, S1, S0
VSTR	#1, S0, [SP, #12]
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+6)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+6)
LDRH	R4, [R0, #0]
MOVS	R5, #0
MOVW	R0, #lo_addr(_deltaTemp+0)
MOVT	R0, #hi_addr(_deltaTemp+0)
LDRD	R2, R3, [R0, #0]
UMULL	R0, R1, R2, R4
MLA	R1, R3, R4, R1
MLA	R1, R2, R5, R1
STRD	R0, R1, [SP, #4]
VMOV.F32	S1, #8
VMOV.F32	S0, #2
BL	_pow+0
LDRD	R0, R1, [SP, #4]
VSTR	#1, S0, [SP, #4]
BL	__SignedLongLongToFloat+0
VMOV	S0, R0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S0, S1
VLDR	#1, S0, [SP, #12]
VADD.F32	S1, S0, S1
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensitivity+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensitivity+0)
VSTR	#1, S1, [R0, #0]
;ROV_UART_XRotor.c,467 :: 		P =(((( q1 * sensitivity ) / pow( 2, 21 ) - sensorOffset) / pow( 2, 15 )) / 10);
LDR	R0, [SP, #20]
VLDR	#1, S0, [R0, #0]
VCVT.F32	#0, S0, S0
VMUL.F32	S0, S0, S1
VSTR	#1, S0, [SP, #4]
VMOV.F32	S1, #21
VMOV.F32	S0, #2
BL	_pow+0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S1, S0
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorOffset+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorOffset+0)
VLDR	#1, S0, [R0, #0]
VSUB.F32	S0, S1, S0
VSTR	#1, S0, [SP, #4]
VMOV.F32	S1, #15
VMOV.F32	S0, #2
BL	_pow+0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S1, S0
VMOV.F32	S0, #10
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(ROV_UART_XRotor_P+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_P+0)
VSTR	#1, S0, [R0, #0]
;ROV_UART_XRotor.c,468 :: 		T = ( 2000 + ((long long)deltaTemp * sensorCoefficients[6] ) / pow( 2, 23))/100;
MOVW	R0, #lo_addr(ROV_UART_XRotor_sensorCoefficients+12)
MOVT	R0, #hi_addr(ROV_UART_XRotor_sensorCoefficients+12)
LDRH	R4, [R0, #0]
MOVS	R5, #0
LDR	R0, [SP, #16]
LDRD	R2, R3, [R0, #0]
UMULL	R0, R1, R2, R4
MLA	R1, R3, R4, R1
MLA	R1, R2, R5, R1
STRD	R0, R1, [SP, #4]
VMOV.F32	S1, #23
VMOV.F32	S0, #2
BL	_pow+0
LDRD	R0, R1, [SP, #4]
VSTR	#1, S0, [SP, #4]
BL	__SignedLongLongToFloat+0
VMOV	S0, R0
VLDR	#1, S1, [SP, #4]
VDIV.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17658
VMOV	S0, R0
VADD.F32	S1, S0, S1
MOVW	R0, #0
MOVT	R0, #17096
VMOV	S0, R0
VDIV.F32	S0, S1, S0
MOVW	R0, #lo_addr(ROV_UART_XRotor_T+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_T+0)
VSTR	#1, S0, [R0, #0]
;ROV_UART_XRotor.c,471 :: 		}
L_end_MS5803_Read_Sensor:
LDR	LR, [SP, #0]
ADD	SP, SP, #24
BX	LR
; end of _MS5803_Read_Sensor
_init_UART:
;ROV_UART_XRotor.c,484 :: 		void init_UART(){
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,490 :: 		&_GPIO_MODULE_UART4_PA01);
MOVW	R0, #lo_addr(__GPIO_MODULE_UART4_PA01+0)
MOVT	R0, #hi_addr(__GPIO_MODULE_UART4_PA01+0)
PUSH	(R0)
;ROV_UART_XRotor.c,489 :: 		_UART_ONE_STOPBIT,
MOVW	R3, #0
;ROV_UART_XRotor.c,488 :: 		_UART_NOPARITY,
MOVW	R2, #0
;ROV_UART_XRotor.c,487 :: 		_UART_8_BIT_DATA,
MOVW	R1, #0
;ROV_UART_XRotor.c,486 :: 		UART4_Init_Advanced(9600,
MOVW	R0, #9600
;ROV_UART_XRotor.c,490 :: 		&_GPIO_MODULE_UART4_PA01);
BL	_UART4_Init_Advanced+0
ADD	SP, SP, #4
;ROV_UART_XRotor.c,491 :: 		Delay_ms(100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_init_UART36:
SUBS	R7, R7, #1
BNE	L_init_UART36
NOP
NOP
NOP
;ROV_UART_XRotor.c,493 :: 		}
L_end_init_UART:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_UART
_init_ADC:
;ROV_UART_XRotor.c,497 :: 		void init_ADC()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;ROV_UART_XRotor.c,502 :: 		_ADC_CHANNEL_13);
MOVW	R0, #15360
BL	_ADC_Set_Input_Channel+0
;ROV_UART_XRotor.c,504 :: 		ADC1_Init();
BL	_ADC1_Init+0
;ROV_UART_XRotor.c,505 :: 		}
L_end_init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _init_ADC
_main:
;ROV_UART_XRotor.c,522 :: 		void main() {
SUB	SP, SP, #32
;ROV_UART_XRotor.c,527 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;ROV_UART_XRotor.c,529 :: 		Init_MCU();
BL	_Init_MCU+0
;ROV_UART_XRotor.c,531 :: 		MS5803_Init();
BL	_MS5803_Init+0
;ROV_UART_XRotor.c,533 :: 		init_ADC();
BL	_init_ADC+0
;ROV_UART_XRotor.c,541 :: 		init_LEVI();
BL	_init_LEVI+0
;ROV_UART_XRotor.c,542 :: 		PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM4_Set_Duty+0
;ROV_UART_XRotor.c,543 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main38:
SUBS	R7, R7, #1
BNE	L_main38
NOP
NOP
NOP
;ROV_UART_XRotor.c,546 :: 		init_DESNI();
BL	_init_DESNI+0
;ROV_UART_XRotor.c,547 :: 		PWM_TIM3_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM3_Set_Duty+0
;ROV_UART_XRotor.c,548 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main40:
SUBS	R7, R7, #1
BNE	L_main40
NOP
NOP
NOP
;ROV_UART_XRotor.c,552 :: 		init_THRUSTER();
BL	_init_THRUSTER+0
;ROV_UART_XRotor.c,553 :: 		PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
MOVW	R0, #2451
BL	_PWM_TIM4_Set_Duty+0
;ROV_UART_XRotor.c,554 :: 		Delay_ms(2000);
MOVW	R7, #57598
MOVT	R7, #1525
NOP
NOP
L_main42:
SUBS	R7, R7, #1
BNE	L_main42
NOP
NOP
NOP
;ROV_UART_XRotor.c,558 :: 		init_SVETLO();
BL	_init_SVETLO+0
;ROV_UART_XRotor.c,563 :: 		init_UART();
BL	_init_UART+0
;ROV_UART_XRotor.c,566 :: 		Delay_ms(100);
MOVW	R7, #19262
MOVT	R7, #76
NOP
NOP
L_main44:
SUBS	R7, R7, #1
BNE	L_main44
NOP
NOP
NOP
;ROV_UART_XRotor.c,573 :: 		while(1){
L_main46:
;ROV_UART_XRotor.c,575 :: 		MS5803_Read_Sensor();
BL	_MS5803_Read_Sensor+0
;ROV_UART_XRotor.c,577 :: 		WordToStr(P,dubina);
ADD	R1, SP, #0
MOVW	R0, #lo_addr(ROV_UART_XRotor_P+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_P+0)
VLDR	#1, S0, [R0, #0]
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
BL	_WordToStr+0
;ROV_UART_XRotor.c,579 :: 		WordToStr(T,temperatura);
ADD	R1, SP, #10
MOVW	R0, #lo_addr(ROV_UART_XRotor_T+0)
MOVT	R0, #hi_addr(ROV_UART_XRotor_T+0)
VLDR	#1, S0, [R0, #0]
VCVT	#1, .F32, S0, S0
VMOV	R0, S0
UXTH	R0, R0
BL	_WordToStr+0
;ROV_UART_XRotor.c,584 :: 		al = ADC1_Get_Sample(11);
MOVS	R0, #11
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_al+0)
MOVT	R1, #hi_addr(_al+0)
STRH	R0, [R1, #0]
;ROV_UART_XRotor.c,587 :: 		WordToStr(al,voda);
ADD	R1, SP, #20
BL	_WordToStr+0
;ROV_UART_XRotor.c,596 :: 		if (UART_Data_Ready()) {
BL	_UART_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_main48
;ROV_UART_XRotor.c,598 :: 		stanje = UART_Read();
BL	_UART_Read+0
MOVW	R1, #lo_addr(_stanje+0)
MOVT	R1, #hi_addr(_stanje+0)
STRB	R0, [R1, #0]
;ROV_UART_XRotor.c,600 :: 		}
L_main48:
;ROV_UART_XRotor.c,604 :: 		if ( stanje == 'W') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #87
IT	NE
BNE	L_main49
;ROV_UART_XRotor.c,606 :: 		Napred();
BL	_Napred+0
;ROV_UART_XRotor.c,609 :: 		UART4_Write_Text("\n\tNAPRED\n\n");
MOVW	R0, #lo_addr(?lstr1_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr1_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,611 :: 		}
IT	AL
BAL	L_main50
L_main49:
;ROV_UART_XRotor.c,616 :: 		else if ( stanje == 'S') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #83
IT	NE
BNE	L_main51
;ROV_UART_XRotor.c,618 :: 		Nazad();
BL	_Nazad+0
;ROV_UART_XRotor.c,620 :: 		UART4_Write_Text("\n\tNAZAD\n\n");
MOVW	R0, #lo_addr(?lstr2_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr2_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,622 :: 		}
IT	AL
BAL	L_main52
L_main51:
;ROV_UART_XRotor.c,627 :: 		else if ( stanje== 'A') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #65
IT	NE
BNE	L_main53
;ROV_UART_XRotor.c,629 :: 		Levo();
BL	_Levo+0
;ROV_UART_XRotor.c,631 :: 		UART4_Write_Text("\n\tLEVO\n\n");
MOVW	R0, #lo_addr(?lstr3_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr3_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,633 :: 		}
IT	AL
BAL	L_main54
L_main53:
;ROV_UART_XRotor.c,638 :: 		else if ( stanje == 'D') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #68
IT	NE
BNE	L_main55
;ROV_UART_XRotor.c,640 :: 		Desno();
BL	_Desno+0
;ROV_UART_XRotor.c,642 :: 		UART4_Write_Text("\n\tDESNO\n\n");
MOVW	R0, #lo_addr(?lstr4_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr4_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,644 :: 		}
IT	AL
BAL	L_main56
L_main55:
;ROV_UART_XRotor.c,649 :: 		else if ( stanje == '+') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #43
IT	NE
BNE	L_main57
;ROV_UART_XRotor.c,651 :: 		Zaron();
BL	_Zaron+0
;ROV_UART_XRotor.c,653 :: 		UART4_Write_Text("\n\tZARON\n\n");
MOVW	R0, #lo_addr(?lstr5_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr5_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,655 :: 		}
IT	AL
BAL	L_main58
L_main57:
;ROV_UART_XRotor.c,660 :: 		else if ( stanje == '-') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #45
IT	NE
BNE	L_main59
;ROV_UART_XRotor.c,662 :: 		Izron();
BL	_Izron+0
;ROV_UART_XRotor.c,664 :: 		UART4_Write_Text("\n\tIZRON");
MOVW	R0, #lo_addr(?lstr6_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr6_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,665 :: 		UART4_Write_Text("ZA PREKID IZRONA : + a zatim C\n\n");
MOVW	R0, #lo_addr(?lstr7_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr7_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,667 :: 		}
IT	AL
BAL	L_main60
L_main59:
;ROV_UART_XRotor.c,672 :: 		else if ( stanje == 'C') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #67
IT	NE
BNE	L_main61
;ROV_UART_XRotor.c,674 :: 		Stop();
BL	_Stop+0
;ROV_UART_XRotor.c,676 :: 		UART4_Write_Text("\n\tSTOP\n\n");
MOVW	R0, #lo_addr(?lstr8_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr8_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,678 :: 		}
IT	AL
BAL	L_main62
L_main61:
;ROV_UART_XRotor.c,684 :: 		else if ( stanje == 'V') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #86
IT	NE
BNE	L_main63
;ROV_UART_XRotor.c,686 :: 		Svetlo_ON();
BL	_Svetlo_ON+0
;ROV_UART_XRotor.c,688 :: 		UART4_Write_Text("\n\tUKLJUCI SVETLO\n\n");
MOVW	R0, #lo_addr(?lstr9_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr9_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,690 :: 		}
IT	AL
BAL	L_main64
L_main63:
;ROV_UART_XRotor.c,695 :: 		else if ( stanje == 'B') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #66
IT	NE
BNE	L_main65
;ROV_UART_XRotor.c,697 :: 		Svetlo_OFF();
BL	_Svetlo_OFF+0
;ROV_UART_XRotor.c,700 :: 		UART4_Write_Text("\n\tISKLJUCI SVETLO");
MOVW	R0, #lo_addr(?lstr10_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr10_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,701 :: 		UART4_Write_Text("\n\n");
MOVW	R0, #lo_addr(?lstr11_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr11_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,702 :: 		}
IT	AL
BAL	L_main66
L_main65:
;ROV_UART_XRotor.c,708 :: 		else if ( stanje == 'P') {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #80
IT	NE
BNE	L_main67
;ROV_UART_XRotor.c,715 :: 		UART4_Write_Text("\n----------------------------------------");
MOVW	R0, #lo_addr(?lstr12_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr12_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,719 :: 		UART4_Write_Text("\n\n\tPritisak:");
MOVW	R0, #lo_addr(?lstr13_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr13_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,720 :: 		UART4_Write_Text(dubina);
ADD	R0, SP, #0
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,721 :: 		UART4_Write_Text("mbar");
MOVW	R0, #lo_addr(?lstr14_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr14_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,722 :: 		UART4_Write_Text("");
MOVW	R0, #lo_addr(?lstr15_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr15_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,725 :: 		UART4_Write_Text("\n\tDubina:");
MOVW	R0, #lo_addr(?lstr16_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr16_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,726 :: 		UART4_Write_Text(dubina);
ADD	R0, SP, #0
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,727 :: 		UART4_Write_Text("cm");
MOVW	R0, #lo_addr(?lstr17_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr17_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,732 :: 		UART4_Write_Text("\n\tDubina:");
MOVW	R0, #lo_addr(?lstr18_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr18_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,733 :: 		UART4_Write_Text(dubina);
ADD	R0, SP, #0
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,734 :: 		UART4_Write_Text(" m");
MOVW	R0, #lo_addr(?lstr19_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr19_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,740 :: 		UART4_Write_Text("\n\n\tTEMPERATURA:");
MOVW	R0, #lo_addr(?lstr20_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr20_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,741 :: 		UART4_Write_Text(temperatura);
ADD	R0, SP, #10
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,742 :: 		UART4_Write(176);
MOVS	R0, #176
BL	_UART4_Write+0
;ROV_UART_XRotor.c,743 :: 		UART4_Write(67);
MOVS	R0, #67
BL	_UART4_Write+0
;ROV_UART_XRotor.c,746 :: 		UART4_Write_Text("\n-------------------------------------------");
MOVW	R0, #lo_addr(?lstr21_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr21_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,747 :: 		UART4_Write_Text("\n\n");
MOVW	R0, #lo_addr(?lstr22_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr22_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,748 :: 		}
IT	AL
BAL	L_main68
L_main67:
;ROV_UART_XRotor.c,756 :: 		else if  ( stanje == 'I' && al >=20) {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #73
IT	NE
BNE	L__main79
MOVW	R0, #lo_addr(_al+0)
MOVT	R0, #hi_addr(_al+0)
LDRH	R0, [R0, #0]
CMP	R0, #20
IT	CC
BCC	L__main78
L__main77:
;ROV_UART_XRotor.c,758 :: 		UART4_Write_Text("\n\t-Informacije-\n");
MOVW	R0, #lo_addr(?lstr23_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr23_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,759 :: 		UART4_Write_Text("\n----------------------------------------\n");
MOVW	R0, #lo_addr(?lstr24_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr24_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,761 :: 		UART4_Write_Text("\t*LAKE ALARM:");
MOVW	R0, #lo_addr(?lstr25_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr25_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,762 :: 		UART4_Write_Text("SUVO");
MOVW	R0, #lo_addr(?lstr26_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr26_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,763 :: 		UART4_Write_Text(voda);
ADD	R0, SP, #20
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,765 :: 		UART4_Write_Text("\n\n\t*Baterija:");
MOVW	R0, #lo_addr(?lstr27_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr27_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,766 :: 		UART4_Write_Text("11,58 V\n\n");
MOVW	R0, #lo_addr(?lstr28_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr28_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,769 :: 		UART4_Write_Text("\t*Amperaza\n");
MOVW	R0, #lo_addr(?lstr29_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr29_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,770 :: 		UART4_Write_Text("\t-ESC_LEVI:1A\n\n");
MOVW	R0, #lo_addr(?lstr30_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr30_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,771 :: 		UART4_Write_Text("\t-ESC_DESNI:1A\n\n");
MOVW	R0, #lo_addr(?lstr31_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr31_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,772 :: 		UART4_Write_Text("\t-ESC_THRUSTER:1A\n\n");
MOVW	R0, #lo_addr(?lstr32_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr32_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,775 :: 		UART4_Write_Text("\t*SVETLO:1A\n\n");
MOVW	R0, #lo_addr(?lstr33_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr33_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,777 :: 		UART4_Write_Text("\n----------------------------------------");
MOVW	R0, #lo_addr(?lstr34_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr34_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,779 :: 		}
IT	AL
BAL	L_main72
;ROV_UART_XRotor.c,756 :: 		else if  ( stanje == 'I' && al >=20) {
L__main79:
L__main78:
;ROV_UART_XRotor.c,782 :: 		else if  ( stanje == 'I' && al <=20) {
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
LDRB	R0, [R0, #0]
CMP	R0, #73
IT	NE
BNE	L__main81
MOVW	R0, #lo_addr(_al+0)
MOVT	R0, #hi_addr(_al+0)
LDRH	R0, [R0, #0]
CMP	R0, #20
IT	HI
BHI	L__main80
L__main76:
;ROV_UART_XRotor.c,784 :: 		UART4_Write_Text("\n\t-Informacije-\n\n");
MOVW	R0, #lo_addr(?lstr35_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr35_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,785 :: 		UART4_Write_Text("\n----------------------------------------\n");
MOVW	R0, #lo_addr(?lstr36_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr36_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,787 :: 		UART4_Write_Text("\t*LAKE ALARM:");
MOVW	R0, #lo_addr(?lstr37_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr37_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,788 :: 		UART4_Write_Text("POPLAVA");
MOVW	R0, #lo_addr(?lstr38_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr38_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,789 :: 		UART4_Write_Text(voda);
ADD	R0, SP, #20
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,791 :: 		UART4_Write_Text("\n\n\t*Baterija:");
MOVW	R0, #lo_addr(?lstr39_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr39_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,792 :: 		UART4_Write_Text("11,58 V\n\n");
MOVW	R0, #lo_addr(?lstr40_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr40_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,796 :: 		UART4_Write_Text("\t*Amperaza\n");
MOVW	R0, #lo_addr(?lstr41_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr41_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,798 :: 		UART4_Write_Text("\t-ESC_LEVI:1A\n\n");
MOVW	R0, #lo_addr(?lstr42_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr42_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,800 :: 		UART4_Write_Text("\t-ESC_DESNI:1A\n\n");
MOVW	R0, #lo_addr(?lstr43_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr43_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,802 :: 		UART4_Write_Text("\t-ESC_THRUSTER:1A\n\n");
MOVW	R0, #lo_addr(?lstr44_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr44_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,805 :: 		UART4_Write_Text("\t*SVETLO:1A\n\n");
MOVW	R0, #lo_addr(?lstr45_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr45_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,807 :: 		UART4_Write_Text("\n----------------------------------------");
MOVW	R0, #lo_addr(?lstr46_ROV_UART_XRotor+0)
MOVT	R0, #hi_addr(?lstr46_ROV_UART_XRotor+0)
BL	_UART4_Write_Text+0
;ROV_UART_XRotor.c,782 :: 		else if  ( stanje == 'I' && al <=20) {
L__main81:
L__main80:
;ROV_UART_XRotor.c,809 :: 		}
L_main72:
L_main68:
L_main66:
L_main64:
L_main62:
L_main60:
L_main58:
L_main56:
L_main54:
L_main52:
L_main50:
;ROV_UART_XRotor.c,812 :: 		stanje  = '\o';
MOVS	R1, #0
MOVW	R0, #lo_addr(_stanje+0)
MOVT	R0, #hi_addr(_stanje+0)
STRB	R1, [R0, #0]
;ROV_UART_XRotor.c,828 :: 		PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVW	R0, #lo_addr(_LEVI+0)
MOVT	R0, #hi_addr(_LEVI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #3
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV_UART_XRotor.c,830 :: 		PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_DESNI+0)
MOVT	R0, #hi_addr(_DESNI+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM3_Set_Duty+0
;ROV_UART_XRotor.c,832 :: 		PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVW	R0, #lo_addr(_THRUSTER+0)
MOVT	R0, #hi_addr(_THRUSTER+0)
LDRH	R0, [R0, #0]
MOVS	R2, #2
MOVS	R1, #0
BL	_PWM_TIM4_Set_Duty+0
;ROV_UART_XRotor.c,834 :: 		PWM_TIM9_Set_Duty(SVETLO,_PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVW	R0, #lo_addr(_SVETLO+0)
MOVT	R0, #hi_addr(_SVETLO+0)
LDRH	R0, [R0, #0]
MOVS	R2, #0
MOVS	R1, #0
BL	_PWM_TIM9_Set_Duty+0
;ROV_UART_XRotor.c,836 :: 		}
IT	AL
BAL	L_main46
;ROV_UART_XRotor.c,840 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
