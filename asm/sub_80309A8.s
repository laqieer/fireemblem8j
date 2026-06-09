	.syntax unified
	.set AllocWeatherParticles, 0x08030144 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80309A8, "ax", %progbits
@ sub_80309A8 @ JP 0x080309A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80309A8
	.thumb_func
sub_80309A8:
	push {lr}
	movs r0, #0
	bl AllocWeatherParticles
	ldr r0, _080309C8 @ =0x085CC024
	ldr r1, _080309CC @ =0x020027DC
	bl sub_8013008
	ldr r0, _080309D0 @ =0x085CC540
	movs r1, #0xd0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	pop {r0}
	bx r0
	.align 2, 0
_080309C8: .4byte 0x085CC024
_080309CC: .4byte 0x020027DC
_080309D0: .4byte 0x085CC540

