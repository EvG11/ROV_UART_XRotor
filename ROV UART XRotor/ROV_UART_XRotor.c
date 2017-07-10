/*
               
                ---- MikroROV ---


  * autor Milos Petakovic
  *  DRUGA VERZIJA PROGRAMA

  * Test konfiguracija:
              * MCU: STM32F407VG
               * Dev.Board: Clicker2 for STM32
                * Oscillator: PLL_25_to_150 MHz

        Moduli:
                * 3x XROTOR-ESC

                * USB UART click

                * Pressure 2 click

                * Senzor vode

                *Senzor vodenog okruzenja


                * Svetlo HALOGEN 50W

                        *( prekidac PWM + IRF 540 N 100V 33A LL N-MOSFET )


* SW: MikroC PRO for ARM v5.1.0




||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

*Potreban kabl za vezu :

                         * Clicker  <---> USB UART Click

                            *3 ZICE -TX,RX,GND( NPR: mikrofonski~3mm +,-,sirm)



*Ako se koristi i usb web camera:

                          * UTP CAT 5E kabl

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////



               -  Program - UART ROV Control -


 *Omogucava :
             *Upravljanje podmornicom iz USART terminala

             *Komande se zadaju sa tastature PC-a

------------------------------ PC KEYBOARD KOMANDE -----------------------------
|
|
|                 W-NAPRED                  (I P) -INFORMACIJE dubina,napon...
|          A-LEVO         D-DESNO
|                  S-NAZAD
|                                      (V B)-SVETLO on/off         +       -
|                                                                ZARON   IZRON
|        *Ukljuciti CAPS LOCK !!!
|
--------------------------------------------------------------------------------


 *Kontrolu kretanja: ZARNON,IZRON,NAPRED,NAZAD,LEVO DESNO ( + - W S A D )

             *Kontrolu svetla :
                             * ON( V )

                             * OFF( B )


 *Daje informacije o :
                      *Akcijama kretanja

                      *Temperaturi vode  (P)

                      *Temperaturi elektronike   (I)

                      *Pritisku i DUBINI     (P)

                      *Naponu baterije       (I)

                      *Struji po ESC-u       (I)

                      *Alarmu prodiranja vode u podmornicu   (I)

                      *Senzoru vode   (I)




**************************************************************************
**************************************************************************
**************************************************************************/

  #define  INIT  0x993
  #define  NAPRED  2650

  #define  NAZAD  2310
  #define LEVO    2650

  #define DESNO   2310
  #define  ZARON  2650

  #define  IZRON  2310
  #define  STOP   0X995

  #define UKLJUCENO 2650
  #define ISKLJUCENO 0



  #include <senzor.h>


//*****************************************************************************



unsigned int pwm_period,Y,al;

unsigned int LEVI,DESNI,THRUSTER,SVETLO;

char stanje;


sbit Chip_Select at GPIOE_ODR.B11;


static unsigned int   sensorCoefficients[8];
static unsigned long  q1           = 0;
static unsigned long  q2           = 0;
long long             deltaTemp    = 0;
static float          P = 0, T = 0;
static float          sensorOffset = 0;
static float          sensitivity  = 0;
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


//******************************************************************************
//********************************FUNKCIJE*************************************

//******************************************************************************

  //3x PWM za MOTORE (Levi,Desni,Thruster)

  // ADC za senzore vode i voltmetar
  
  
  
  // Pressure 2 click

  //UART za monitoring i kontrolu kretanja




//******************************************************************************


//--------------------------------LEVI------------------------------------------


void init_LEVI()
{
     pwm_period = PWM_TIM4_Init(50);
     PWM_TIM4_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM4_CH4_PB9);

}

//--------------------------------DESNI-----------------------------------------


void init_DESNI()
{
     pwm_period = PWM_TIM3_Init(50);
     PWM_TIM3_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM3_CH3_PB0);

}

//--------------------------------THRUSTER--------------------------------------


void init_THRUSTER()
{
     pwm_period = PWM_TIM4_Init(50);
     PWM_TIM4_Start(_PWM_CHANNEL3, &_GPIO_MODULE_TIM4_CH3_PB8);

}

//-----------------------------------SVETLO-------------------------------------

void init_SVETLO()
{
     pwm_period = PWM_TIM9_Init(50);
     PWM_TIM9_Start(_PWM_CHANNEL1, &_GPIO_MODULE_TIM9_CH1_PE5);

}




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//------------------------------K R E T A NJ E----------------------------------
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~funkcije~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


void Napred(){

       LEVI=NAPRED;

       DESNI=NAPRED;

       THRUSTER=STOP;
  }
  
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Nazad(){

       LEVI=NAZAD;

       DESNI=NAZAD;

       THRUSTER=STOP;

  }
  
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Levo(){

       LEVI=LEVO;

       DESNI=DESNO;

       THRUSTER=STOP;

   }
   
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
void Desno(){

       LEVI=DESNO;

       DESNI=LEVO;

       THRUSTER=STOP;

   }
   
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
void Zaron(){

       LEVI=STOP;

       DESNI=STOP;

       THRUSTER=ZARON;

  }
  
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
void Izron(){

       LEVI=STOP;

       DESNI=STOP;

       THRUSTER=IZRON;

  }
  
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  
void Stop(){

       LEVI=STOP;

       DESNI=STOP;

       THRUSTER=STOP;

   }


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Svetlo_ON() {

    SVETLO = UKLJUCENO;

   }

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

void Svetlo_OFF(){

     SVETLO = ISKLJUCENO;

   }
   
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

////////////////////////////////////////////////////////////////////////////////
////////////////////////// Pressure 2 click ////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////




void MSS5803_Reset(){
  Chip_Select = 0;
  SPI2_Write(MS5803_CMD_RESET);
  Delay_ms(5);
  Chip_Select = 1;
}


unsigned Read_MSS5803_ReadCoefficient(char index){
  unsigned int result = 0;
  Chip_Select = 0;
  SPI2_Read(MS5803_CMD_PROM_RD + (index*2));
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
  unsigned char  n_bit;

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
  SPI2_Write(MS5803_CMD_ADC_CONV + cmd);
  switch (cmd & 0x0f) {
    case MS5803_CMD_ADC_256 : Delay_us(900); break;
    case MS5803_CMD_ADC_512 : Delay_ms(3);   break;
    case MS5803_CMD_ADC_1024: Delay_ms(4);   break;
    case MS5803_CMD_ADC_2048: Delay_ms(8);   break;
    case MS5803_CMD_ADC_4096: Delay_ms(14);  break;
  }
  Chip_Select = 1;
  Delay_ms(3);
  Chip_Select = 0;
  SPI2_Read(MS5803_CMD_ADC_READ);
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
    return FALSE;
  }
  else{
    return TRUE;
  }
}



void MS5803_Read_Sensor() {
  q1 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D1 + MS5803_CMD_ADC_4096);
  q2 = MS5803_Cmd_Adc(MS5803_CMD_ADC_D2 + MS5803_CMD_ADC_4096);


  asm nop


  deltaTemp = q2 - sensorCoefficients[5] * pow( 2, 8 );
  sensorOffset = sensorCoefficients[2] * pow( 2, 16 ) + ( (long long)deltaTemp * sensorCoefficients[4] ) / pow( 2, 7 );
  sensitivity = sensorCoefficients[1] * pow( 2, 15 ) + ( (long long)deltaTemp * sensorCoefficients[3] ) / pow( 2, 8 );


P =(((( q1 * sensitivity ) / pow( 2, 21 ) - sensorOffset) / pow( 2, 15 )) / 10);
T = ( 2000 + ((long long)deltaTemp * sensorCoefficients[6] ) / pow( 2, 23))/100;


}




////////////////////////////////////////////////////////////////////////////////
//-------------------------------UART-------------------------------------------
////////////////////////////////////////////////////////////////////////////////





void init_UART(){

UART4_Init_Advanced(9600,
  _UART_8_BIT_DATA,
  _UART_NOPARITY,
  _UART_ONE_STOPBIT,
  &_GPIO_MODULE_UART4_PA01);
       Delay_ms(100);

                 }

//------------------------------------ADC---------------------------------------

void init_ADC()
{
    ADC_Set_Input_Channel(_ADC_CHANNEL_10|
                          _ADC_CHANNEL_11|
                          _ADC_CHANNEL_12|
                          _ADC_CHANNEL_13);

     ADC1_Init();
}






//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//******************** G L A V N I   P R O G R A M *****************************
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>



void main() {
char dubina[10];
char temperatura[10];
char voda[10];

GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);

Init_MCU();

MS5803_Init();

init_ADC();

//------------------------------------------------------------------------------
//----------------------- init FUNKCIJA i ESC modula ---------------------------
//------------------------------------------------------------------------------



init_LEVI();
PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL4);
                    Delay_ms(2000);
//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init_DESNI();
PWM_TIM3_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
                   Delay_ms(2000);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init_THRUSTER();
PWM_TIM4_Set_Duty(INIT,_PWM_NON_INVERTED, _PWM_CHANNEL3);
                    Delay_ms(2000);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init_SVETLO();


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

init_UART();


    Delay_ms(100);

//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




 while(1){

            MS5803_Read_Sensor();

            WordToStr(P,dubina);

            WordToStr(T,temperatura);


//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

            al = ADC1_Get_Sample(11);


            WordToStr(al,voda);


//==============================================================================
//==================      POCETAK ISPITIVANJA USLOVA     =======================
//==============================================================================



          if (UART_Data_Ready()) {

             stanje = UART_Read();

          }

//============================ N A P R E D =====================================

          if ( stanje == 'W') {

              Napred();


              UART4_Write_Text("\n\tNAPRED\n\n");

          }


//============================ N A Z A D  ======================================

          else if ( stanje == 'S') {

              Nazad();

              UART4_Write_Text("\n\tNAZAD\n\n");

          }


//============================ L E V O =========================================

          else if ( stanje== 'A') {

               Levo();

              UART4_Write_Text("\n\tLEVO\n\n");

          }


//============================ D E S N O =======================================

          else if ( stanje == 'D') {

               Desno();

              UART4_Write_Text("\n\tDESNO\n\n");

          }


//============================ Z A R O N =======================================

          else if ( stanje == '+') {

               Zaron();

              UART4_Write_Text("\n\tZARON\n\n");

          }


//============================ I Z R O N =======================================

          else if ( stanje == '-') {

              Izron();

              UART4_Write_Text("\n\tIZRON");
              UART4_Write_Text("ZA PREKID IZRONA : + a zatim C\n\n");

          }


//============================  STOPIRA MOTORE  ================================

          else if ( stanje == 'C') {

               Stop();

              UART4_Write_Text("\n\tSTOP\n\n");

          }


//==============================================================================

           //ukljuceno svetlo
          else if ( stanje == 'V') {

               Svetlo_ON();

              UART4_Write_Text("\n\tUKLJUCI SVETLO\n\n");

          }



               //iskljuceno svetlo
          else if ( stanje == 'B') {

               Svetlo_OFF();


              UART4_Write_Text("\n\tISKLJUCI SVETLO");
              UART4_Write_Text("\n\n");
          }


//==================  D U B I N A    &   T E M P E R A T U R A  ================


          else if ( stanje == 'P') {






               UART4_Write_Text("\n----------------------------------------");


               //Ispis pritiska u mbar
               UART4_Write_Text("\n\n\tPritisak:");
               UART4_Write_Text(dubina);
               UART4_Write_Text("mbar");
               UART4_Write_Text("");

                //Ispis dubine u cm
               UART4_Write_Text("\n\tDubina:");
               UART4_Write_Text(dubina);
               UART4_Write_Text("cm");



               //Ispis dubine u m
               UART4_Write_Text("\n\tDubina:");
               UART4_Write_Text(dubina);
               UART4_Write_Text(" m");




                 //Ispis temperature
               UART4_Write_Text("\n\n\tTEMPERATURA:");
               UART4_Write_Text(temperatura);
               UART4_Write(176);
               UART4_Write(67);


              UART4_Write_Text("\n-------------------------------------------");
               UART4_Write_Text("\n\n");
          }




//============================ I N F O R M A C I J E ===========================


          else if  ( stanje == 'I' && al >=20) {

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


                      else if  ( stanje == 'I' && al <=20) {

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


          stanje  = '\o';


//==============================================================================
//=========================== KRAJ ISPITIVANJA USLOVA ==========================
//==============================================================================





//---------------------- UPIS PWM VREDNOSTI ------------------------------------




       PWM_TIM4_Set_Duty(LEVI,_PWM_NON_INVERTED, _PWM_CHANNEL4);

       PWM_TIM3_Set_Duty(DESNI,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM4_Set_Duty(THRUSTER,_PWM_NON_INVERTED, _PWM_CHANNEL3);

       PWM_TIM9_Set_Duty(SVETLO,_PWM_NON_INVERTED, _PWM_CHANNEL1);

}



}




////////////////////////////////////////////////////////////////////////////////
//
//                           - K R A J -
//
////////////////////////////////////////////////////////////////////////////////