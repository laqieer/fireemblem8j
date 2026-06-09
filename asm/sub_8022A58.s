	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set UnitGive, 0x080180DC + 1
	.set sub_80181B0, 0x080181B0 + 1
	.set sub_8022A24, 0x08022A24 + 1
	.section .text.sub_8022A58, "ax", %progbits
@ sub_8022A58 @ JP 0x08022A58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022A58
	.thumb_func
sub_8022A58:
	push {r4, r5, lr}
	ldr r4, _08022AA4 @ =0x0203A954
	movs r0, #0xb
	strb r0, [r4, #0x11]
	ldrb r0, [r1, #2]
	strb r0, [r4, #0xd]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_80181B0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8022A24
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl UnitGive
	movs r0, #0x17
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_08022AA4: .4byte 0x0203A954

