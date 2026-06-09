	.syntax unified
	.set SioSend, 0x08042238 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8042F1C, "ax", %progbits
@ sub_8042F1C @ JP 0x08042F1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8042F1C
	.thumb_func
sub_8042F1C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08042F5C @ =0x03004EFC
	movs r2, #0
	movs r1, #0xc9
	strb r1, [r0]
	ldr r4, _08042F60 @ =0x085D31E8
	ldr r1, [r4]
	ldrb r1, [r1, #6]
	strb r1, [r0, #1]
	strh r2, [r0, #2]
	movs r1, #4
	bl SioSend
	ldr r4, [r4]
	ldrb r0, [r4, #0xa]
	ldrb r1, [r4, #9]
	ands r0, r1
	cmp r0, r1
	bne _08042F54
	movs r1, #6
	ldrsb r1, [r4, r1]
	movs r0, #1
	lsls r0, r1
	strb r0, [r4, #0xa]
	adds r0, r5, #0
	bl sub_8002DE4
_08042F54:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08042F5C: .4byte 0x03004EFC
_08042F60: .4byte 0x085D31E8

