	.syntax unified
	.set AllocWeatherParticles, 0x08030144 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80195E4, 0x080195E4 + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_80310C4, "ax", %progbits
@ sub_80310C4 @ JP 0x080310C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80310C4
	.thumb_func
sub_80310C4:
	push {r4, lr}
	ldr r4, _080310F0 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl sub_80195E4
	ldrb r0, [r4, #0x15]
	bl AllocWeatherParticles
	bl sub_8019914
	bl sub_8027144
	bl sub_80265CC
	bl sub_8026F38
	bl sub_80042E0
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080310F0: .4byte 0x0202BCEC

