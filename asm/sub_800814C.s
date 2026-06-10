	.syntax unified
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.section .text.sub_800814C, "ax", %progbits
@ sub_800814C @ JP 0x0800814C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800814C
	.thumb_func
sub_800814C:
	push {r4, r5, r6, lr}
	ldr r2, _08008198 @ =0x085B90D4
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
	bge _08008190
	adds r6, r2, #0
_08008170:
	lsls r4, r5, #3
	ldr r0, _0800819C @ =0x030000C8
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
	blt _08008170
_08008190:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08008198: .4byte 0x085B90D4
_0800819C: .4byte 0x030000C8

