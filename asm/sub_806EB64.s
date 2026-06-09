	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.set sub_8056890, 0x08056890 + 1
	.section .text.sub_806EB64, "ax", %progbits
@ sub_806EB64 @ JP 0x0806EB64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806EB64
	.thumb_func
sub_806EB64:
	push {r4, lr}
	adds r4, r0, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	blt _0806EB8A
	ldr r0, [r4, #0x4c]
	lsls r1, r1, #5
	adds r0, r0, r1
	movs r1, #0x20
	bl sub_80567E0
	b _0806EB98
_0806EB8A:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _0806EB98
	adds r0, r4, #0
	bl sub_8002DE4
_0806EB98:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

