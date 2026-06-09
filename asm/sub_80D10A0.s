	.syntax unified
	.set OpAnimHS_BrightenPalette, 0x080D0EC4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D0DB4, 0x080D0DB4 + 1
	.section .text.sub_80D10A0, "ax", %progbits
@ sub_80D10A0 @ JP 0x080D10A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D10A0
	.thumb_func
sub_80D10A0:
	push {r4, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r3, [r4, #0x2c]
	adds r3, #1
	str r3, [r4, #0x2c]
	ldr r0, _080D10DC @ =0x08BAB5E4
	movs r1, #0x1e
	subs r3, r1, r3
	str r1, [sp]
	movs r1, #0
	movs r2, #1
	bl OpAnimHS_BrightenPalette
	ldr r0, [r4, #0x2c]
	cmp r0, #0x1d
	ble _080D10CC
	movs r0, #0x28
	str r0, [r4, #0x30]
	adds r0, r4, #0
	bl sub_8002DE4
_080D10CC:
	adds r0, r4, #0
	bl sub_80D0DB4
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D10DC: .4byte 0x08BAB5E4

