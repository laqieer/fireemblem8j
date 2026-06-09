	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_804A73C, "ax", %progbits
@ sub_804A73C @ JP 0x0804A73C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A73C
	.thumb_func
sub_804A73C:
	push {lr}
	adds r2, r0, #0
	ldr r0, _0804A75C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804A756
	adds r0, r2, #0
	bl sub_8002DE4
_0804A756:
	pop {r0}
	bx r0
	.align 2, 0
_0804A75C: .4byte 0x085775CC

