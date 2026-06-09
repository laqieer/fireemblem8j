	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_80C6EC4, "ax", %progbits
@ sub_80C6EC4 @ JP 0x080C6EC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C6EC4
	.thumb_func
sub_80C6EC4:
	push {lr}
	adds r1, r0, #0
	ldrh r0, [r1, #0x2a]
	adds r0, #1
	strh r0, [r1, #0x2a]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	cmp r0, #0x4a
	bhi _080C6EFA
	ldrh r0, [r1, #0x2a]
	lsls r0, r0, #4
	movs r1, #0x4b
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	lsls r1, r0, #0x18
	lsrs r1, r1, #0x18
	movs r2, #0x10
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
	b _080C6F00
_080C6EFA:
	adds r0, r1, #0
	bl sub_8002DE4
_080C6F00:
	pop {r0}
	bx r0

