	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802F584, 0x0802F584 + 1
	.section .text.sub_802F65C, "ax", %progbits
@ sub_802F65C @ JP 0x0802F65C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F65C
	.thumb_func
sub_802F65C:
	push {r4, lr}
	ldr r4, _0802F67C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r2, [r4, #0x12]
	movs r1, #1
	movs r3, #1
	bl sub_802F584
	bl sub_802C94C
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802F67C: .4byte 0x0203A954

