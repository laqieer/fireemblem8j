	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_807B4C8, 0x0807B4C8 + 1
	.section .text.sub_807BA2C, "ax", %progbits
@ sub_807BA2C @ JP 0x0807BA2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BA2C
	.thumb_func
sub_807BA2C:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r1, [r4]
	subs r0, r1, #1
	strh r0, [r4]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x11
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _0807BA60
	ldr r0, [r5, #0x54]
	bl sub_807B4C8
	adds r0, r5, #0
	bl sub_8002DE4
_0807BA60:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

