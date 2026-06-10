	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802DCA4, 0x0802DCA4 + 1
	.section .text.sub_8022F74, "ax", %progbits
@ sub_8022F74 @ JP 0x08022F74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022F74
	.thumb_func
sub_8022F74:
	push {r4, lr}
	ldr r2, _08022F9C @ =0x0203A954
	movs r0, #0x1d
	strb r0, [r2, #0x11]
	ldr r0, _08022FA0 @ =0x03004DF0
	ldr r4, [r0]
	movs r0, #2
	ldrsb r0, [r1, r0]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	movs r2, #0
	bl sub_802DCA4
	movs r0, #0x17
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_08022F9C: .4byte 0x0203A954
_08022FA0: .4byte 0x03004DF0

