	.syntax unified
	.set GetTarget, 0x08050AA8 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.section .text.sub_8035FD8, "ax", %progbits
@ sub_8035FD8 @ JP 0x08035FD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035FD8
	.thumb_func
sub_8035FD8:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r0, [r0, r1]
	bl GetTarget
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #1
	ldrsb r2, [r0, r2]
	adds r0, r4, #0
	bl sub_8015E18
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

