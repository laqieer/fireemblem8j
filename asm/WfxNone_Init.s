	.syntax unified
	.set AllocWeatherParticles, 0x08030144 + 1
	.set SetSecondaryHBlankHandler, 0x08001D3C + 1
	.section .text.WfxNone_Init, "ax", %progbits
@ WfxNone_Init @ JP 0x08030190 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WfxNone_Init
	.thumb_func
WfxNone_Init:
	push {lr}
	ldr r0, _080301A4 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	movs r0, #0
	bl SetSecondaryHBlankHandler
	pop {r0}
	bx r0
	.align 2, 0
_080301A4: .4byte 0x0202BCEC

