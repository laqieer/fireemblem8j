	.syntax unified
	.set GetSpellAssocFacing, 0x0807A6AC + 1
	.set sub_807D704, 0x0807D704 + 1
	.section .text.sub_807BD20, "ax", %progbits
@ sub_807BD20 @ JP 0x0807BD20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BD20
	.thumb_func
sub_807BD20:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r1, _0807BD54 @ =0x0203E1EC
	adds r0, r1, #0
	adds r0, #0x58
	ldrb r5, [r0]
	movs r4, #1
	subs r4, r4, r5
	ldr r0, [r1, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetSpellAssocFacing
	adds r2, r0, #0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_807D704
	movs r0, #0
	strh r0, [r6, #0x18]
	strh r0, [r6, #0x1a]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807BD54: .4byte 0x0203E1EC

