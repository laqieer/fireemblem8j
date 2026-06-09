	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8083548, "ax", %progbits
@ sub_8083548 @ JP 0x08083548 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8083548
	.thumb_func
sub_8083548:
	push {r4, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x40
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
	adds r2, r4, #0
	adds r2, #0x42
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldrh r3, [r2]
	cmp r0, r3
	bhs _08083582
	ldrh r0, [r1]
	lsls r0, r0, #4
	ldrh r1, [r2]
	bl __divsi3
	movs r1, #0x10
	subs r1, r1, r0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	b _08083594
_08083582:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r4, #0
	bl sub_8002DE4
_08083594:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

