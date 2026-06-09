	.syntax unified
	.section .text.MU_SetupPixelEffect, "ax", %progbits
@ MU_SetupPixelEffect @ JP 0x0807BAE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MU_SetupPixelEffect
	.thumb_func
MU_SetupPixelEffect:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, _0807BB38 @ =0x08A13330
	adds r1, r1, r0
	ldrb r0, [r1]
	movs r2, #7
	ands r2, r0
	ldrb r1, [r1]
	lsrs r1, r1, #3
	ldr r4, _0807BB3C @ =0x030018F0
	ldr r3, _0807BB40 @ =0x030018F4
	lsls r2, r2, #2
	movs r0, #0xf
	lsls r0, r2
	str r0, [r3]
	mvns r0, r0
	str r0, [r4]
	movs r2, #0
	lsls r6, r1, #2
	adds r4, r0, #0
	movs r7, #0xe0
	lsls r7, r7, #2
_0807BB14:
	adds r3, r2, #1
	movs r2, #3
_0807BB18:
	adds r1, r6, r5
	ldr r0, [r1]
	ands r0, r4
	str r0, [r1]
	adds r5, #0x20
	subs r2, #1
	cmp r2, #0
	bge _0807BB18
	adds r5, r5, r7
	adds r2, r3, #0
	cmp r2, #3
	ble _0807BB14
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807BB38: .4byte 0x08A13330
_0807BB3C: .4byte 0x030018F0
_0807BB40: .4byte 0x030018F4

