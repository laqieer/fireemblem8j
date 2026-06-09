	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set Proc_StartBlocking, 0x08002C30 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802EEE4, "ax", %progbits
@ sub_802EEE4 @ JP 0x0802EEE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EEE4
	.thumb_func
sub_802EEE4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802EF3C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x14]
	strb r1, [r0, #0x11]
	ldr r0, _0802EF40 @ =0x0203A568
	ldrb r1, [r4, #0x13]
	adds r2, r0, #0
	adds r2, #0x73
	strb r1, [r2]
	ldrb r1, [r4, #0x14]
	adds r0, #0x74
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_802CB8C
	bl sub_802C94C
	ldr r0, _0802EF44 @ =0x085C42D0
	adds r1, r5, #0
	bl Proc_StartBlocking
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EF3C: .4byte 0x0203A954
_0802EF40: .4byte 0x0203A568
_0802EF44: .4byte 0x085C42D0

