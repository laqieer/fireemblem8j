	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802C134, 0x0802C134 + 1
	.section .text.sub_802CB54, "ax", %progbits
@ sub_802CB54 @ JP 0x0802CB54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CB54
	.thumb_func
sub_802CB54:
	push {r4, lr}
	ldr r4, _0802CB6C @ =0x0203A4E8
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r1, r4, #0
	bl sub_802C134
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0802CB6C: .4byte 0x0203A4E8

