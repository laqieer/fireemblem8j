	.syntax unified
	.set CallARM_DecompText, 0x08002AF4 + 1
	.section .text.sub_8009FE4, "ax", %progbits
@ sub_8009FE4 @ JP 0x08009FE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009FE4
	.thumb_func
sub_8009FE4:
	push {r4, lr}
	adds r4, r1, #0
	ldr r1, _0800A000 @ =0x0814D08C
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r4, #0
	bl CallARM_DecompText
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0
_0800A000: .4byte 0x0814D08C

