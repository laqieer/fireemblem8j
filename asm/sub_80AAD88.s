	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_802EAC4, 0x0802EAC4 + 1
	.section .text.sub_80AAD88, "ax", %progbits
@ sub_80AAD88 @ JP 0x080AAD88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AAD88
	.thumb_func
sub_80AAD88:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0
	bl sub_802EAC4
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl WriteAndVerifySramFast
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

