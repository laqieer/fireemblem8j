	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.section .text.DisableMapPaletteAnimations, "ax", %progbits
@ DisableMapPaletteAnimations @ JP 0x08030B74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DisableMapPaletteAnimations
	.thumb_func
DisableMapPaletteAnimations:
	push {lr}
	ldr r0, _08030B8C @ =0x085C5D98
	bl Proc_Find
	adds r1, r0, #0
	cmp r1, #0
	beq _08030B86
	movs r0, #0
	str r0, [r1, #0x38]
_08030B86:
	pop {r0}
	bx r0
	.align 2, 0
_08030B8C: .4byte 0x085C5D98

