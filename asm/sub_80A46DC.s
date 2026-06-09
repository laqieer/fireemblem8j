	.syntax unified
	.set ChangeBgm, 0x08002938 + 1
	.section .text.sub_80A46DC, "ax", %progbits
@ sub_80A46DC @ JP 0x080A46DC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A46DC
	.thumb_func
sub_80A46DC:
	push {lr}
	sub sp, #4
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0
	str r0, [sp]
	movs r0, #0x34
	adds r1, r2, #0
	movs r3, #0x20
	bl ChangeBgm
	add sp, #4
	pop {r0}
	bx r0

