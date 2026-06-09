	.syntax unified
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set sub_80048D8, 0x080048D8 + 1
	.set sub_80B2874, 0x080B2874 + 1
	.section .text.sub_80B628C, "ax", %progbits
@ sub_80B628C @ JP 0x080B628C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B628C
	.thumb_func
sub_80B628C:
	push {r4, lr}
	adds r4, r0, #0
	bl sub_80048D8
	adds r0, r4, #0
	bl sub_80B2874
	movs r0, #0
	bl SetPrimaryHBlankHandler
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

