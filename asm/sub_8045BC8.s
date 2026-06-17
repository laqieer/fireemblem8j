	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.SioMain2_WaitEndAndRoute, "ax", %progbits
@ SioMain2_WaitEndAndRoute @ JP 0x08045BC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioMain2_WaitEndAndRoute
	.thumb_func
SioMain2_WaitEndAndRoute:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _08045C00 @ =0x085D4760
	bl Proc_Find
	cmp r0, #0
	bne _08045BFA
	ldr r5, _08045C04 @ =0x0203DA20
	ldrb r0, [r5, #0xb]
	cmp r0, #1
	bne _08045BE6
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_08045BE6:
	ldrb r0, [r5, #0xb]
	cmp r0, #2
	bne _08045BF4
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
_08045BF4:
	adds r0, r4, #0
	bl sub_8002DE4
_08045BFA:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08045C00: .4byte 0x085D4760
_08045C04: .4byte 0x0203DA20

