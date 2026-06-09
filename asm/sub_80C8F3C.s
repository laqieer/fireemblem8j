	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set _DivArm2, 0x0800BB3C + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80D6378, 0x080D6378 + 1
	.section .text.sub_80C8F3C, "ax", %progbits
@ sub_80C8F3C @ JP 0x080C8F3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C8F3C
	.thumb_func
sub_80C8F3C:
	push {r4, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x30]
	adds r0, #1
	strh r0, [r4, #0x30]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x77
	bgt _080C8F82
	movs r0, #0x30
	ldrsh r1, [r4, r0]
	movs r0, #0x77
	subs r0, r0, r1
	movs r1, #0x78
	movs r2, #1
	bl _DivArm2
	adds r1, r0, #0
	movs r0, #0x80
	lsls r0, r0, #5
	subs r1, r0, r1
	lsls r1, r1, #4
	bl sub_80D6378
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	b _080C8F94
_080C8F82:
	movs r0, #1
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	bl sub_8002DE4
_080C8F94:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

