#include <substrate.h>
#import <UIKit/UIKit.h>

// 1. Apuntamos a la función interna del juego que dibuja la línea de la guía
// (Esta función cambia según la versión, pero el concepto es el mismo)
float (*original_getGuidelineLength)(void *instance);

float custom_getGuidelineLength(void *instance) {
    // 2. Modificamos el truco: En vez de la línea corta original, 
    // obligamos al juego a dibujar una línea gigante.
    return 9999.0f; 
}

// 3. El constructor que inyecta el hack cuando el juego se abre
__attribute__((constructor)) static void initializeHack() {
    // Engañamos a la memoria del juego reemplazando la función original por la nuestra
    MSHookFunction((void *)0x1000000, (void *)&custom_getGuidelineLength, (void **)&original_getGuidelineLength);
}
