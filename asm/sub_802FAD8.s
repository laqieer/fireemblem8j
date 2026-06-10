	.syntax unified
	.set AddTrap, 0x0802E1F0 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802FAD8, "ax", %progbits
@ sub_802FAD8 @ JP 0x0802FAD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802FAD8
	.thumb_func
sub_802FAD8:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FB08 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	movs r2, #0xa
	movs r3, #8
	bl AddTrap
	adds r0, r5, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FB08: .4byte 0x0203A954

