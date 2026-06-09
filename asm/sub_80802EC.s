	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.section .text.sub_80802EC, "ax", %progbits
@ sub_80802EC @ JP 0x080802EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80802EC
	.thumb_func
sub_80802EC:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r3, [r4]
	adds r0, r3, #1
	strh r0, [r4]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	movs r0, #0x1e
	str r0, [sp]
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_8012E84
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0x1e
	ble _0808032C
	adds r0, r5, #0
	bl sub_8002DE4
_0808032C:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0

