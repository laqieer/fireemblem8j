	.syntax unified
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8008E10, 0x08008E10 + 1
	.section .text.sub_80080E8, "ax", %progbits
@ sub_80080E8 @ JP 0x080080E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80080E8
	.thumb_func
sub_80080E8:
	push {r4, r5, r6, lr}
	ldr r0, _08008140 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl sub_8008E10
	ldr r2, _08008144 @ =0x085B90D4
	ldr r0, [r2]
	movs r1, #0
	strb r1, [r0, #9]
	ldr r0, [r2]
	adds r0, #0x82
	strb r1, [r0]
	ldr r0, [r2]
	strb r1, [r0, #0x15]
	ldr r0, [r2]
	strb r1, [r0, #0xb]
	movs r5, #0
	ldr r0, [r2]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	bge _0800813A
	adds r6, r2, #0
_0800811A:
	lsls r4, r5, #3
	ldr r0, _08008148 @ =0x030000C8
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8003CF8
	ldr r0, [r6]
	ldrb r1, [r0, #8]
	adds r0, r4, #0
	bl sub_8003D90
	adds r5, #1
	ldr r0, [r6]
	ldrb r0, [r0, #0xa]
	cmp r5, r0
	blt _0800811A
_0800813A:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008140: .4byte 0x02022CA8
_08008144: .4byte 0x085B90D4
_08008148: .4byte 0x030000C8

