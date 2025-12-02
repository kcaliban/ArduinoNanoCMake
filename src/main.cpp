// cant use constexpr as AVR headers expect a macro
#define F_CPU 16'000'000UL  // CPU frequency

#include <avr/io.h>
#include <util/delay.h>

// On-board LED blinking at 500ms interval
int main() {
  DDRB |= (1 << PB5);

  while (1) {
    PORTB |= (1 << PB5);
    _delay_ms(500);
    PORTB &= ~(1 << PB5);
    _delay_ms(500);
  }
  return 0;
}