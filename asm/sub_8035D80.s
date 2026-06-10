	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8035D80, "ax", %progbits
@ sub_8035D80 @ JP 0x08035D80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035D80
	.thumb_func
sub_8035D80:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	ldr r0, [r4, #0x34]
	adds r1, r1, r0
	str r1, [r4, #0x2c]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r1, r4, #0
	adds r1, #0x4c
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _08035DB0
	adds r0, r4, #0
	bl sub_8002DE4
_08035DB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

