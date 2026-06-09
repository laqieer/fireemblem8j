	.syntax unified
	.set GetUnitInfoWindowX, 0x080348DC + 1
	.set PutText, 0x08003DA0 + 1
	.set sub_8034744, 0x08034744 + 1
	.set sub_8034904, 0x08034904 + 1
	.section .text.sub_8034EB8, "ax", %progbits
@ sub_8034EB8 @ JP 0x08034EB8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8034EB8
	.thumb_func
sub_8034EB8:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	movs r1, #0xa
	bl GetUnitInfoWindowX
	adds r4, r0, #0
	movs r0, #0xa
	str r0, [sp]
	movs r0, #1
	str r0, [sp, #4]
	movs r0, #0
	adds r1, r6, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8034744
	adds r5, r0, #0
	adds r5, #0x38
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8034904
	adds r4, #0x61
	lsls r4, r4, #1
	ldr r0, _08034F00 @ =0x02022CA8
	adds r4, r4, r0
	adds r0, r5, #0
	adds r1, r4, #0
	bl PutText
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08034F00: .4byte 0x02022CA8

