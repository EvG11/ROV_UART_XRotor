#line 1 "C:/Users/Vukica/Desktop/ROV mikroC/ROV UART XRotor/ROV_UART_XRotor.c"
#line 1 "c:/users/vukica/desktop/rov mikroc/rov uart xrotor/senzor.h"
#line 134 "C:/Users/Vukica/Desktop/ROV mikroC/ROV UART XRotor/ROV_UART_XRotor.c"
unsigned int pwm_period,Y,al;

unsigned int LEVI,DESNI,THRUSTER,SVETLO;

char stanje;


sbit Chip_Select at GPIOE_ODR.B11;


static unsigned int sensorCoefficients[8];
static unsigned long q1 = 0;
static unsigned long q2 = 0;
long long deltaTemp = 0;
static float P = 0, T = 0;
static float sensorOffset = 0;
static float sensitivity = 0;
unsigned long value = 0;
unsigned long value_old = 0;
unsigned long temp;
char temperature_value_string[11];
char pressure_value_string[11];
int TK=23;
void Init_MCU(){
 GPIO_Digital_Output(&GPIOE_ODR, _GPIO_PINMASK_11);

 SPI2_Init_Advanced(_SPI_FPCLK_DIV16, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_SECOND_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
 &_GPIO_MODULE_SPI2_PB13_14_15);

}
#line 192 "C:/Users/Vukica/Desktop/ROV mikroC/ROV UART XRotor/ROV_UART_XRotor.c"
void init_LEVI()
{
 pwm_period = PWM_TIM4_Init(50);
 PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);

}




void init_DESNI()
{
 pwm_period = PWM_TIM3_Init(50);
 PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);

}




void init_THRUSTER()
{
 pwm_period = PWM_TIM4_Init(50);
 PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);

}



void init_SVETLO()
{
 pwm_period = PWM_TIM9_Init(50);
 PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);

}
#line 238 "C:/Users/Vukica/Desktop/ROV mikroC/ROV UART XRotor/ROV_UART_XRotor.c"
void Napred(){

 LEVI= 2650 ;

 DESNI= 2650 ;

 THRUSTER= 0X995 ;
 }



void Nazad(){

 LEVI= 2310 ;

 DESNI= 2310 ;

 THRUSTER= 0X995 ;

 }



void Levo(){

 LEVI= 2650 ;

 DESNI= 2310 ;

 THRUSTER= 0X995 ;

 }



void Desno(){

 LEVI= 2310 ;

 DESNI= 2650 ;

 THRUSTER= 0X995 ;

 }



void Zaron(){

 LEVI= 0X995 ;

 DESNI= 0X995 ;

 THRUSTER= 2650 ;

 }



void Izron(){

 LEVI= 0X995 ;

 DESNI= 0X995 ;

 THRUSTER= 2310 ;

 }



void Stop(){

 LEVI= 0X995 ;

 DESNI= 0X995 ;

 THRUSTER= 0X995 ;

 }




void Svetlo_ON() {

 SVETLO =  2650 ;

 }



void Svetlo_OFF(){

 SVETLO =  0 ;

 }










void MSS5803_Reset(){
 Chip_Select = 0;
 SPI2_Write( (0x1E) );
 Delay_ms(5);
 Chip_Select = 1;
}


unsigned Read_MSS5803_ReadCoefficient(char index){
 unsigned int result = 0;
 Chip_Select = 0;
 SPI2_Read( (0xA0)  + (index*2));
 result=SPI2_read(0x00);
 result=result << 8;
 result |= SPI2_Read(0x00);
 Chip_Select = 1;

 return result;
}




char MS5803_CRC4(unsigned int n_prom[]){
 int cnt;
 unsigned int n_rem;
 unsigned int crc_read;
 unsigned char n_bit;

 n_rem = 0x00;
 crc_read = sensorCoefficients[7];
 sensorCoefficients[7] = ( 0xFF00 & ( sensorCoefficients[7] ) );
 for (cnt = 0; cnt < 16; cnt++) {

 if ( cnt%2 == 1 ) n_rem ^= (unsigned short) ( ( sensorCoefficients[cnt>>1] ) & 0x00FF );

 else n_rem ^= (unsigned short) ( sensorCoefficients[cnt>>1] >> 8 );
 for ( n_bit = 8; n_bit > 0; n_bit-- ) {
 if ( n_rem & ( 0x8000 ) ) {
 n_rem = ( n_rem << 1 ) ^ 0x3000;
 }
 else {
 n_rem = ( n_rem << 1 );
 }
 }
 }
 n_rem = ( 0x000F & ( n_rem >> 12 ) );
 sensorCoefficients[7] = crc_read;

 return ( n_rem ^ 0x00 );
}



unsigned long MS5803_Cmd_Adc(char cmd){
 unsigned long result = 0;
 unsigned long returnedData = 0;

 Chip_Select=0;
 SPI2_Write( (0x40)  + cmd);
 switch (cmd & 0x0f) {
 case  (0x00)  : Delay_us(900); break;
 case  (0x02)  : Delay_ms(3); break;
 case  (0x04) : Delay_ms(4); break;
 case  (0x06) : Delay_ms(8); break;
 case  (0x08) : Delay_ms(14); break;
 }
 Chip_Select = 1;
 Delay_ms(3);
 Chip_Select = 0;
 SPI2_Read( (0x00) );
 returnedData = SPI2_Read(0x00);
 result = (returnedData << 16);
 returnedData = SPI2_Read(0x00);
 result = result + (returnedData << 8);
 returnedData = SPI2_Read(0x00);
 result = result + returnedData;
 Chip_Select = 1;

 return result;
}



char MS5803_Init() {
 unsigned char p_crc, n_crc;
 int i = 0;
 MSS5803_Reset();
 for ( i = 0; i < 8; i++ ){
 sensorCoefficients[ i ] = Read_MSS5803_ReadCoefficient( i );
 }
 p_crc = sensorCoefficients[ 7 ];
 n_crc = MS5803_CRC4( sensorCoefficients );


 asm nop



 if(p_crc!=n_crc){
 return  0 ;
 }
 else{
 return  1 ;
 }
}



void MS5803_Read_Sensor() {
 q1 = MS5803_Cmd_Adc( (0x00)  +  (0x08) );
 q2 = MS5803_Cmd_Adc( (0x10)  +  (0x08) );


 asm nop


 deltaTemp = q2 - sensorCoefficients[5] * pow( 2, 8 );
 sensorOffset = sensorCoefficients[2] * pow( 2, 16 ) + ( (long long)deltaTemp * sensorCoefficients[4] ) / pow( 2, 7 );
 sensitivity = sensorCoefficients[1] * pow( 2, 15 ) + ( (long long)deltaTemp * sensorCoefficients[3] ) / pow( 2, 8 );


P =(((( q1 * sensitivity ) / pow( 2, 21 ) - sensorOffset) / pow( 2, 15 )) / 10);
T = ( 2000 + ((long long)deltaTemp * sensorCoefficients[6] ) / pow( 2, 23))/100;


}
#line 484 "C:/Users/Vukica/Desktop/ROV mikroC/ROV UART XRotor/ROV_UART_XRotor.c"
void init_UART(){

UART4_Init_Advanced(9600,
 _UART_8_BIT_DATA,
 _UART_NOPARITY,
 _UART_ONE_STOPBIT,
 &_GPIO_MODULE_UART4_PA01);
 Delay_ms(100);

 }



void init_ADC()
{
 ADC_Set_Input_Channel(_ADC_CHANNEL_10|
 _ADC_CHANNEL_11|
 _ADC_CHANNEL_12|
 _ADC_CHANNEL_13);

 ADC1_Init();
}
#line 522 "C:/Users/Vukica/Desktop/ROV mikroC/ROV UART XRotor/ROV_UART_XRotor.c"
void main() {
char dubina[10];
char temperatura[10];
char voda[10];

GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);

Init_MCU();

MS5803_Init();

init_ADC();







init_LEVI();
PWM_TIM4_Set_Duty( 0x993 ,_PWM_NON_INVERTED, _PWM_CHANNEL4);
 Delay_ms(2000);


init_DESNI();
PWM_TIM3_Set_Duty( 0x993 ,_PWM_NON_INVERTED, _PWM_CHANNEL3);
 Delay_ms(2000);



init_THRUSTER();
PWM_TIM4_Set_Duty( 0x993 ,_PWM_NON_INVERTED, _PWM_CHANNEL3);
 Delay_ms(2000);



init_SVETLO();




init_UART();


 Delay_ms(100);






 while(1){

 MS5803_Read_Sensor();

 WordToStr(P,dubina);

 WordToStr(T,temperatura);




 al = ADC1_Get_Sample(11);


 WordToStr(al,voda);








 if (UART_Data_Ready()) {

 stanje = UART_Read();

 }



 if ( stanje == 'W') {

 Napred();


 UART4_Write_Text("\n\tNAPRED\n\n");

 }




 else if ( stanje == 'S') {

 Nazad();

 UART4_Write_Text("\n\tNAZAD\n\n");

 }




 else if ( stanje== 'A') {

 Levo();

 UART4_Write_Text("\n\tLEVO\n\n");

 }




 else if ( stanje == 'D') {

 Desno();

 UART4_Write_Text("\n\tDESNO\n\n");

 }




 else if ( stanje == '+') {

 Zaron();

 UART4_Write_Text("\n\tZARON\n\n");

 }




 else if ( stanje == '-') {

 Izron();

 UART4_Write_Text("\n\tIZRON");
 UART4_Write_Text("ZA PREKID IZRONA : + a zatim C\n\n");

 }




 else if ( stanje == 'C') {

 Stop();

 UART4_Write_Text("\n\tSTOP\n\n");

 }





 else if ( stanje == 'V') {

 Svetlo_ON();

 UART4_Write_Text("\n\tUKLJUCI SVETLO\n\n");

 }




 else if ( stanje == 'B') {

 Svetlo_OFF();


 UART4_Write_Text("\n\tISKLJUCI SVETLO");
 UART4_Write_Text("\n\n");
 }





 else if ( stanje == 'P') {






 UART4_Write_Text("\n----------------------------------------");



 UART4_Write_Text("\n\n\tPritisak:");
 UART4_Write_Text(dubina);
 UART4_Write_Text("mbar");
 UART4_Write_Text("");


 UART4_Write_Text("\n\tDubina:");
 UART4_Write_Text(dubina);
 UART4_Write_Text("cm");




 UART4_Write_Text("\n\tDubina:");
 UART4_Write_Text(dubina);
 UART4_Write_Text(" m");





 UART4_Write_Text("\n\n\tTEMPERATURA:");
 UART4_Write_Text(temperatura);
 UART4_Write(176);
 UART4_Write(67);


 UART4_Write_Text("\n-------------------------------------------");
 UART4_Write_Text("\n\n");
 }







 else if ( stanje == 'I' && al >=20) {

 UART4_Write_Text("\n\t-Informacije-\n");
UART4_Write_Text("\n----------------------------------------\n");

 UART4_Write_Text("\t*LAKE ALARM:");
 UART4_Write_Text("SUVO");
 UART4_Write_Text(voda);

 UART4_Write_Text("\n\n\t*Baterija:");
 UART4_Write_Text("11,58 V\n\n");


 UART4_Write_Text("\t*Amperaza\n");
 UART4_Write_Text("\t-ESC_LEVI:1A\n\n");
 UART4_Write_Text("\t-ESC_DESNI:1A\n\n");
 UART4_Write_Text("\t-ESC_THRUSTER:1A\n\n");


 UART4_Write_Text("\t*SVETLO:1A\n\n");

UART4_Write_Text("\n----------------------------------------");

}


 else if ( stanje == 'I' && al <=20) {

 UART4_Write_Text("\n\t-Informacije-\n\n");
UART4_Write_Text("\n----------------------------------------\n");

 UART4_Write_Text("\t*LAKE ALARM:");
 UART4_Write_Text("POPLAVA");
 UART4_Write_Text(voda);

 UART4_Write_Text("\n\n\t*Baterija:");
 UART4_Write_Text("11,58 V\n\n");



 UART4_Write_Text("\t*Amperaza\n");

 UART4_Write_Text("\t-ESC_LEVI:1A\n\n");

 UART4_Write_Text("\t-ESC_DESNI:1A\n\n");

 UART4_Write_Text("\t-ESC_THRUSTER:1A\n\n");


 UART4_Write_Text("\t*SVETLO:1A\n\n");

UART4_Write_Text("\n----------------------------------------");

}


 stanje = '\o';
#line 828 "C:/Users/Vukica/Desktop/ROV mikroC/ROV UART XRotor/ROV_UART_XRotor.c"
 PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

 PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

 PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);

 PWM_TIM9_Set_Duty(SVETLO,_PWM_NON_INVERTED, _PWM_CHANNEL1);

}



}
