	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.section .text.sub_802FF6C, "ax", %progbits
@ sub_802FF6C @ JP 0x0802FF6C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FF6C
	.thumb_func
sub_802FF6C:
	push {r4, lr}
	ldr r0, _0802FF98 @ =0x0203A568
	adds r4, r0, #0
	adds r4, #0x6f
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	blt _0802FF90
	ldr r0, _0802FF9C @ =0x0203A954
	ldrb r0, [r0, #0xd]
	bl GetUnit
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl SetUnitStatus
	movs r0, #0xff
	strb r0, [r4]
_0802FF90:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802FF98: .4byte 0x0203A568
_0802FF9C: .4byte 0x0203A954

