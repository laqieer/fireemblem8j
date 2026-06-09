	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.set sub_802EC08, 0x0802EC08 + 1
	.section .text.sub_802EE30, "ax", %progbits
@ sub_802EE30 @ JP 0x0802EE30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EE30
	.thumb_func
sub_802EE30:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _0802EEA0 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	add r3, sp, #4
	adds r0, r5, #0
	mov r2, sp
	bl sub_802EC08
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [sp, #4]
	strb r1, [r0, #0x11]
	ldr r0, _0802EEA4 @ =0x0203A568
	ldr r1, [sp]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldr r1, [sp, #4]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r6, #0
	bl sub_802CB8C
	bl sub_802C94C
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EEA0: .4byte 0x0203A954
_0802EEA4: .4byte 0x0203A568

