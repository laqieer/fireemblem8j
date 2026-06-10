	.syntax unified
	.set ArchiveCurrentPalettes, 0x0801358C + 1
	.set sub_80138B8, 0x080138B8 + 1
	.section .text.sub_8033424, "ax", %progbits
@ sub_8033424 @ JP 0x08033424 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8033424
	.thumb_func
sub_8033424:
	push {r4, lr}
	sub sp, #0x14
	adds r4, r0, #0
	bl ArchiveCurrentPalettes
	movs r2, #0x80
	lsls r2, r2, #1
	movs r0, #0xc0
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _08033454 @ =0xFF00FFF0
	str r0, [sp, #8]
	movs r0, #0x40
	str r0, [sp, #0xc]
	str r4, [sp, #0x10]
	adds r0, r2, #0
	adds r1, r2, #0
	movs r3, #0xc0
	bl sub_80138B8
	add sp, #0x14
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08033454: .4byte 0xFF00FFF0

