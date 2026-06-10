	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_8036434, "ax", %progbits
@ sub_8036434 @ JP 0x08036434 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036434
	.thumb_func
sub_8036434:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	adds r2, r0, #0
	ldrh r1, [r2, #2]
	movs r0, #0xc0
	lsls r0, r0, #3
	cmp r1, r0
	beq _0803645E
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r0, r4, #0
	bl sub_8015E18
_0803645E:
	pop {r4}
	pop {r0}
	bx r0

