	.syntax unified
	.set sub_8003D90, 0x08003D90 + 1
	.section .text.sub_8006A14, "ax", %progbits
@ sub_8006A14 @ JP 0x08006A14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006A14
	.thumb_func
sub_8006A14:
	push {r4, r5, r6, lr}
	ldr r2, _08006A48 @ =0x085B90D4
	ldr r1, [r2]
	strb r0, [r1, #8]
	movs r4, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	bge _08006A40
	adds r6, r2, #0
	ldr r5, _08006A4C @ =0x030000C8
_08006A2A:
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r5, #0
	bl sub_8003D90
	adds r5, #8
	adds r4, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r4, r0
	blt _08006A2A
_08006A40:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08006A48: .4byte 0x085B90D4
_08006A4C: .4byte 0x030000C8

