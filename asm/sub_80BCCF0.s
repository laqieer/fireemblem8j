	.syntax unified
	.set ArchivePalette, 0x080135D8 + 1
	.set sub_80138B8, 0x080138B8 + 1
	.section .text.sub_80BCCF0, "ax", %progbits
@ sub_80BCCF0 @ JP 0x080BCCF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCCF0
	.thumb_func
sub_80BCCF0:
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	ldr r0, [r4, #0x58]
	adds r0, #0x10
	bl ArchivePalette
	movs r2, #0x80
	lsls r2, r2, #1
	movs r3, #0x80
	lsls r3, r3, #2
	str r3, [sp]
	str r3, [sp, #4]
	ldr r1, [r4, #0x58]
	adds r1, #0x10
	movs r0, #1
	lsls r0, r1
	str r0, [sp, #8]
	movs r0, #0x10
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	bl sub_80138B8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

