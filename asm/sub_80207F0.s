	.syntax unified
	.set AllocWeatherParticles, 0x08030144 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_80207F0, "ax", %progbits
@ sub_80207F0 @ JP 0x080207F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80207F0
	.thumb_func
sub_80207F0:
	push {lr}
	movs r0, #0
	bl sub_8001ACC
	bl sub_80156F0
	ldr r0, _08020814 @ =0x0202BCEC
	ldrb r0, [r0, #0x15]
	bl AllocWeatherParticles
	bl sub_8027144
	bl sub_8026F38
	bl sub_80042E0
	pop {r0}
	bx r0
	.align 2, 0
_08020814: .4byte 0x0202BCEC

