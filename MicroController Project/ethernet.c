#include "USART.h"
#include "CLOCK.h"
#include "stm32f446xx.h"

int main ()

{
			initClock();
		UART2_Config();
	while (1){

		UART_SendChar(USART2,'c');
		
	}
	
	
}