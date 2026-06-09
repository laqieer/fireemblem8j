	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807F750, "ax", %progbits
@ sub_807F750 @ JP 0x0807F750 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807F750
	.thumb_func
sub_807F750:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x64
	ldrh r1, [r4]
	adds r1, #2
	strh r1, [r4]
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #7
	ble _0807F77E
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_8002DE4
_0807F77E:
	pop {r4, r5}
	pop {r0}
	bx r0

