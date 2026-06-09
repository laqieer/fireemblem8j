	.syntax unified
	.set sub_800A788, 0x0800A788 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_8014CCC, "ax", %progbits
@ sub_8014CCC @ JP 0x08014CCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8014CCC
	.thumb_func
sub_8014CCC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	adds r5, r2, #0
	adds r6, r3, #0
	lsls r4, r4, #0xc
	adds r1, r4, #0
	bl sub_80D6378
	adds r1, r5, #0
	adds r2, r6, #0
	bl sub_800A788
	pop {r4, r5, r6}
	pop {r1}
	bx r1

