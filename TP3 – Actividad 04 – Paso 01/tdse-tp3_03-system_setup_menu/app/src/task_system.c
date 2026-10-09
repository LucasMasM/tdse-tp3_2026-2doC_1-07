/*
 * Copyright (c) 2026 Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
 * COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 *
 * @author : Juan Manuel Cruz <jcruz@fi.uba.ar> <jcruz@frba.utn.edu.ar>
 */

/********************** inclusions *******************************************/
/* Project includes */
#include "main.h"

/* Demo includes */
#include "logger.h"
#include "dwt.h"

/* Application & Tasks includes */
#include "board.h"
#include "app.h"

#include "task_actuator_attribute.h"
#include "task_actuator_interface.h"
#include "task_display_attribute.h"
#include "task_display_interface.h"
#include "task_system_attribute.h"
#include "task_system_interface.h"

/********************** macros and definitions *******************************/
#define DEL_SYS_MIN			0ul
#define DEL_SYS_MED			250ul
#define DEL_SYS_MAX			500ul


/* Variables globales del menú */
static motor_cfg_t motors[2] = {
    {1, 8, 0}, // Motor 1: ON, Speed 8, LEFT
    {1, 8, 0}  // Motor 2: ON, Speed 8, LEFT
};

static uint8_t selected_motor = 0; // 0: Motor 1, 1: Motor 2
task_system_dta_t task_system_dta_list[1];

/* Función auxiliar para actualizar la pantalla LCD según el estado actual */
static void update_lcd_display(task_system_st_t state) {
    char line1[17];
    char line2[17];

    switch (state) {
        case ST_SYS_MAIN:
            snprintf(line1, sizeof(line1), "M1:%s,%d,%c",
                     motors[0].power ? "ON " : "OFF", motors[0].speed, motors[0].spin ? 'R' : 'L');
            snprintf(line2, sizeof(line2), "M2:%s,%d,%c",
                     motors[1].power ? "ON " : "OFF", motors[1].speed, motors[1].spin ? 'R' : 'L');
            break;

        case ST_SYS_MENU1_M1:
            snprintf(line1, sizeof(line1), "Menu #1        ");
            snprintf(line2, sizeof(line2), "> Motor 1      ");
            break;

        case ST_SYS_MENU1_M2:
            snprintf(line1, sizeof(line1), "Menu #1        ");
            snprintf(line2, sizeof(line2), "> Motor 2      ");
            break;

        case ST_SYS_MENU2_POWER:
            snprintf(line1, sizeof(line1), "Motor %d        ", selected_motor + 1);
            snprintf(line2, sizeof(line2), "> Power        ");
            break;

        case ST_SYS_MENU2_SPEED:
            snprintf(line1, sizeof(line1), "Motor %d        ", selected_motor + 1);
            snprintf(line2, sizeof(line2), "> Speed        ");
            break;

        case ST_SYS_MENU2_SPIN:
            snprintf(line1, sizeof(line1), "Motor %d        ", selected_motor + 1);
            snprintf(line2, sizeof(line2), "> Spin         ");
            break;

        case ST_SYS_MENU3_POWER:
            snprintf(line1, sizeof(line1), "Power Motor %d  ", selected_motor + 1);
            snprintf(line2, sizeof(line2), "> %s          ", motors[selected_motor].power ? "ON " : "OFF");
            break;

        case ST_SYS_MENU3_SPEED:
            snprintf(line1, sizeof(line1), "Speed Motor %d  ", selected_motor + 1);
            snprintf(line2, sizeof(line2), "> %d            ", motors[selected_motor].speed);
            break;

        case ST_SYS_MENU3_SPIN:
            snprintf(line1, sizeof(line1), "Spin Motor %d   ", selected_motor + 1);
            snprintf(line2, sizeof(line2), "> %s        ", motors[selected_motor].spin ? "RIGHT" : "LEFT ");
            break;

        default:
            break;
    }

    put_event_task_display(0, 0, line1);
    put_event_task_display(0, 1, line2);
}

void task_system_init(void *parameters) {
    init_event_task_system();
    task_system_dta_list[0].state = ST_SYS_MAIN;
    task_system_dta_list[0].event = EV_SYS_IDLE;
    task_system_dta_list[0].flag = false;

    update_lcd_display(ST_SYS_MAIN);
}

void task_system_update(void *parameters) {
    task_system_dta_t *p_dta = &task_system_dta_list[0];

    if (any_event_task_system()) {
        p_dta->flag = true;
        p_dta->event = get_event_task_system();
    }

    if (!p_dta->flag) return;
    p_dta->flag = false;

    switch (p_dta->state) {
        /* Nivel Main */
        case ST_SYS_MAIN:
            if (p_dta->event == EV_SYS_ENTER || p_dta->event == EV_SYS_NEXT) {
                p_dta->state = ST_SYS_MENU1_M1;
            }
            break;

        /* Nivel Menu #1 */
        case ST_SYS_MENU1_M1:
            if (p_dta->event == EV_SYS_NEXT) p_dta->state = ST_SYS_MENU1_M2;
            else if (p_dta->event == EV_SYS_ENTER) {
                selected_motor = 0;
                p_dta->state = ST_SYS_MENU2_POWER;
            } else if (p_dta->event == EV_SYS_ESCAPE) p_dta->state = ST_SYS_MAIN;
            break;

        case ST_SYS_MENU1_M2:
            if (p_dta->event == EV_SYS_NEXT) p_dta->state = ST_SYS_MENU1_M1;
            else if (p_dta->event == EV_SYS_ENTER) {
                selected_motor = 1;
                p_dta->state = ST_SYS_MENU2_POWER;
            } else if (p_dta->event == EV_SYS_ESCAPE) p_dta->state = ST_SYS_MAIN;
            break;

        /* Nivel Menu #2 */
        case ST_SYS_MENU2_POWER:
            if (p_dta->event == EV_SYS_NEXT) p_dta->state = ST_SYS_MENU2_SPEED;
            else if (p_dta->event == EV_SYS_ENTER) p_dta->state = ST_SYS_MENU3_POWER;
            else if (p_dta->event == EV_SYS_ESCAPE) p_dta->state = ST_SYS_MENU1_M1;
            break;

        case ST_SYS_MENU2_SPEED:
            if (p_dta->event == EV_SYS_NEXT) p_dta->state = ST_SYS_MENU2_SPIN;
            else if (p_dta->event == EV_SYS_ENTER) p_dta->state = ST_SYS_MENU3_SPEED;
            else if (p_dta->event == EV_SYS_ESCAPE) p_dta->state = ST_SYS_MENU1_M1;
            break;

        case ST_SYS_MENU2_SPIN:
            if (p_dta->event == EV_SYS_NEXT) p_dta->state = ST_SYS_MENU2_POWER;
            else if (p_dta->event == EV_SYS_ENTER) p_dta->state = ST_SYS_MENU3_SPIN;
            else if (p_dta->event == EV_SYS_ESCAPE) p_dta->state = ST_SYS_MENU1_M1;
            break;

        /* Nivel Menu #3 */
        case ST_SYS_MENU3_POWER:
            if (p_dta->event == EV_SYS_NEXT) {
                motors[selected_motor].power ^= 1; // Alterna entre ON y OFF
            } else if (p_dta->event == EV_SYS_ENTER || p_dta->event == EV_SYS_ESCAPE) {
                p_dta->state = ST_SYS_MENU2_POWER;
            }
            break;

        case ST_SYS_MENU3_SPEED:
            if (p_dta->event == EV_SYS_NEXT) {
                motors[selected_motor].speed = (motors[selected_motor].speed + 1) % 10; // Incrementa de 0 a 9
            } else if (p_dta->event == EV_SYS_ENTER || p_dta->event == EV_SYS_ESCAPE) {
                p_dta->state = ST_SYS_MENU2_SPEED;
            }
            break;

        case ST_SYS_MENU3_SPIN:
            if (p_dta->event == EV_SYS_NEXT) {
                motors[selected_motor].spin ^= 1; // Alterna entre LEFT y RIGHT
            } else if (p_dta->event == EV_SYS_ENTER || p_dta->event == EV_SYS_ESCAPE) {
                p_dta->state = ST_SYS_MENU2_SPIN;
            }
            break;

        default:
            p_dta->state = ST_SYS_MAIN;
            break;
    }

    update_lcd_display(p_dta->state);
}

/********************** end of file ******************************************/
