#include "USART.h"
#include "CLOCK.h"
#include "stm32f446xx.h"

/* Function prototypes */
void initTimer(void);
void delay(uint16_t milliseconds);

int main() {
    initClock();
    initTimer(); // Initialize timer for delay generation

    UART2_Config(); // Configure USART2

    while (1) {
        UART_SendChar(USART2, 'c'); // Send 'c' character over USART2
        delay(1000); // Delay for 1 second
			UART_SendString(USART2, "sami");
    }
}

void initTimer(void) {
    // Enable clock for TIM7
    RCC->APB1ENR |= RCC_APB1ENR_TIM7EN;

    // Configure TIM7 settings for delay generation
    // Assuming AHB clock is 140 MHz, APB1 clock is 35 MHz
    // We need to set the prescaler values accordingly

    // For TIM7 on APB1 bus
    // Prescaler = (APB1 frequency) / (desired timer clock) - 1
    //uint32_t apb1_frequency = 35000000; // 35 MHz
    //uint32_t desired_timer_clock = 1000; // 1 kHz (1 ms)
    //uint32_t prescaler_value = (apb1_frequency / desired_timer_clock) - 1;
    TIM7->PSC = 70-1;

    TIM7->ARR = 0xffff; // Auto-reload value (period of timer, 1 ms)

    // Enable TIM7 interrupt
    NVIC_EnableIRQ(TIM7_IRQn);
    TIM7->DIER |= TIM_DIER_UIE; // Enable update interrupt

    // Enable TIM7
    TIM7->CR1 |= TIM_CR1_CEN;
}

// TIM7 interrupt handler for delay generation
void TIM7_IRQHandler(void) {
    if (TIM7->SR & TIM_SR_UIF) {
        // Clear the update interrupt flag
        TIM7->SR &= ~TIM_SR_UIF;
    }
}

// Delay function using TIM7
// Delay function using TIM7
void delay(uint16_t milliseconds) {
    uint16_t initial_count = TIM7->CNT;  // Store initial counter value

    while ((TIM7->CNT - initial_count) < milliseconds);
}
